// import Flutter
// import UIKit

// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }
import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Initialize Flutter
        let controller = window?.rootViewController as! FlutterViewController
        let flutterEngine = controller.engine!
        GeneratedPluginRegistrant.register(with: flutterEngine)

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // Handle deep links
    override func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        // Check the URL scheme
        if url.scheme == "misignet2" {
            print("Received deep link: \(url.absoluteString)")

            // Extract query parameters or path components
            let components = NSURLComponents(url: url, resolvingAgainstBaseURL: false)
            let queryItems = components?.queryItems

            // Print query parameters
            if let queryItems = queryItems {
                for item in queryItems {
                    print("\(item.name): \(item.value ?? "")")
                }
            }

            return true
        }
        return false
    }
}