# How to use

## Create a .env file in the root directory, [.env] and add the following lines to the .env file, replace { Your APi key} with your google maps api key

    GOOGLE_MAP_API_KEY = "Your APi key"

## Then create a gradle.properties file in the android folder, [android/gradle.properties], and add following line in this file, replace {YourApiKey} with your google maps api key

    org.gradle.jvmargs=-Xmx4G
    android.useAndroidX=true
    android.enableJetifier=true
    GOOGLE_MAP_API_KEY=YourApiKey
