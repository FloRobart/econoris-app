import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    /* The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins. */
    id("dev.flutter.flutter-gradle-plugin")
}

/*
 * Release signing key, described by android/key.properties: never committed (see android/.gitignore).
 * The CI writes this file from the secrets of the repository, just before the build.
 *
 * Without it, a release build is signed with the debug key, so that `flutter build apk --release`
 * works on any machine. That is how F-Droid rebuilds the application: it then checks that its build
 * and the APK of the GitHub Release are identical, the signature apart, and publishes the latter.
 */
val releaseKeystorePropertiesFile = rootProject.file("key.properties")
val releaseKeystoreProperties = Properties()

if (releaseKeystorePropertiesFile.exists()) {
    releaseKeystorePropertiesFile.inputStream().use { releaseKeystoreProperties.load(it) }
}

android {
    namespace = "fr.econoris.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "fr.econoris.app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        /* From the "version: X.Y.Z+N" line of pubspec.yaml, written by the CI at each release. */
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    /*
     * The Android Gradle plugin adds to the APK the list of its dependencies, encrypted for Google
     * only: F-Droid refuses this unreadable block. The App Bundle keeps it, as it only goes to Google Play.
     */
    dependenciesInfo {
        includeInApk = false
    }

    signingConfigs {
        if (releaseKeystorePropertiesFile.exists()) {
            create("release") {
                storeFile = file(releaseKeystoreProperties.getProperty("storeFile"))
                storePassword = releaseKeystoreProperties.getProperty("storePassword")
                keyAlias = releaseKeystoreProperties.getProperty("keyAlias")
                keyPassword = releaseKeystoreProperties.getProperty("keyPassword")
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.findByName("release") ?: signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
