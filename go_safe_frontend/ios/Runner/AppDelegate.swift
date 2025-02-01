import UIKit
import Flutter
// import google maps
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Add google maps api key
     if let apiKey = ProcessInfo.processInfo.environment["GOOGLE_MAP_API_KEY"] {
            GMSServices.provideAPIKey(apiKey)
    } else {
            print("Google Maps API Key is missing!")
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
