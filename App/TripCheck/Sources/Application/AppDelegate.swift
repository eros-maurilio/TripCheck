import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
        -> Bool {
            
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
            UINavigationBar
                .appearance()
                .titleTextAttributes = [NSAttributedString
                                            .Key
                                            .foregroundColor: UIColor(Color.tripBlue),
                                        NSAttributedString
                                            .Key
                                            .font: UIFont(name: PublicSans.medium.rawValue, size: 17)!]
            
            UINavigationBar.appearance().barStyle = .default
            
        return true
    }
}
