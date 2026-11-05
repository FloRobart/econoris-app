# Production image of the Econoris web application.
# Base images are pinned by digest so that a compromised tag cannot silently change the build.
# Pulling from dhi.io requires "docker login dhi.io" with a Docker Hub account.

ARG BUILD_BASE_IMAGE=dhi.io/debian-base:bookworm-dev@sha256:358587de16e65b34ebdfb8911b32fc16f71133dcab493af6405d8147e9d73c74

# Step 1: Extract the Flutter version declared in pubspec.yaml
# This stage is isolated so that bumping "version:" in pubspec.yaml keeps the Flutter layers cached
FROM ${BUILD_BASE_IMAGE} AS flutter-version
COPY pubspec.yaml /pubspec.yaml
RUN sed -n "/^environment:/,/^[^ ]/ s/^  flutter: *[\"']\{0,1\}\([0-9][0-9.]*\)[\"']\{0,1\} *\(#.*\)\{0,1\}$/\1/p" /pubspec.yaml > /flutter-version \
    && test -s /flutter-version

# Step 2: Build the Flutter web application
FROM ${BUILD_BASE_IMAGE} AS builder

ENV CI=true \
    FLUTTER_SUPPRESS_ANALYTICS=true \
    PUB_ENVIRONMENT=docker \
    PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl unzip xz-utils ca-certificates

# Packages run their own code during the build: they must not run it as root
RUN install -d -o nonroot -g nonroot /flutter /application
USER nonroot
ENV HOME=/home/nonroot

# Install the exact Flutter version declared in pubspec.yaml
COPY --from=flutter-version /flutter-version /flutter-version
RUN git clone --branch "$(cat /flutter-version)" --depth 1 https://github.com/flutter/flutter.git /flutter \
    && flutter precache --web

WORKDIR /application

# Copy dependency manifests first so source changes keep the dependency cache
COPY --chown=nonroot:nonroot pubspec.yaml pubspec.lock ./
RUN flutter pub get --enforce-lockfile

# Only what the web build needs: anything else in the repository stays out of the image
COPY --chown=nonroot:nonroot assets ./assets
COPY --chown=nonroot:nonroot lib ./lib
COPY --chown=nonroot:nonroot web ./web

# Without a CDN, the application only runs scripts it serves itself, which allows a strict CSP
RUN flutter build web --release --no-web-resources-cdn

# Step 3: Final image served by nginx
# The Debian variant is preferred to the Alpine one because it contains neither a shell nor wget
FROM dhi.io/nginx:1.30-debian13@sha256:30510655d924e2e36dd69815d852f2df43868c83007be3353ec0bb8f5e7b3ab0

# Owned by root: the unprivileged nginx process can read these files but not change them
COPY --from=builder --chown=0:0 /application/build/web /usr/share/nginx/html
COPY --chown=0:0 nginx.conf /etc/nginx/conf.d/default.conf

USER 65532:65532
