ARG DEBIAN_IMAGE=debian:bookworm-slim@sha256:99c0b25c46d0214d5a2091092e7908907dcaecd6a962cde0ac700acee222b6f3

# Step 1: Extract the Flutter version declared in pubspec.yaml
# This stage is isolated so that bumping "version:" in pubspec.yaml keeps the Flutter layers cached
FROM ${DEBIAN_IMAGE} AS flutter-version
COPY pubspec.yaml /pubspec.yaml
RUN sed -n "/^environment:/,/^[^ ]/ s/^  flutter: *[\"']\{0,1\}\([0-9][0-9.]*\)[\"']\{0,1\} *\(#.*\)\{0,1\}$/\1/p" /pubspec.yaml > /flutter-version \
    && test -s /flutter-version

# Step 2: Build the Flutter web application
FROM ${DEBIAN_IMAGE} AS builder

ENV CI=true \
    FLUTTER_SUPPRESS_ANALYTICS=true \
    PUB_ENVIRONMENT=docker \
    PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl unzip xz-utils ca-certificates

# Install the exact Flutter version declared in pubspec.yaml
COPY --from=flutter-version /flutter-version /flutter-version
RUN git clone --branch "$(cat /flutter-version)" --depth 1 https://github.com/flutter/flutter.git /flutter \
    && flutter precache --web

WORKDIR /app

# Copy dependency manifests first so source changes keep the dependency cache
COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get --enforce-lockfile

COPY . .
RUN flutter build web --release

# Step 3: Final image served by nginx
FROM nginx:1.30.6-alpine3.24@sha256:0e52bd054126cdc040b1276c0af347aeb02a41b9cfe305d6094767ac30e97949

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy the Flutter web build
COPY --from=builder /app/build/web /usr/share/nginx/html

# Custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Add a non-root user with fixed UID/GID
RUN addgroup -g 1800 -S econorisgroup && adduser -u 1800 -S econorisuser -G econorisgroup \
    && mkdir -p /run/nginx /var/cache/nginx /var/run /var/log/nginx \
    && chown -R econorisuser:econorisgroup /var/cache/nginx /var/run /var/log/nginx /run/nginx \
    && chmod 0755 /run/nginx
USER econorisuser
