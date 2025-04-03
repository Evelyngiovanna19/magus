plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services") // Firebase (debe ir después de application)
    id("dev.flutter.flutter-gradle-plugin") // Plugin de Flutter
}

android {
    namespace = "com.Mavery" // ✅ Asegúrate de que coincida con Firebase
    compileSdk = 34
    ndkVersion = "25.2.9519653"

    defaultConfig {
        applicationId = "com.Mavery" // ✅ Corrige el applicationId
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")

    // Firebase (solo si usas Firebase)
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))
    implementation("com.google.firebase:firebase-analytics")
}
