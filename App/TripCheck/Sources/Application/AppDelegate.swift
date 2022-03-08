import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            let style = NSMutableParagraphStyle()
            style.firstLineHeadIndent = 12
            UINavigationBar.appearance().largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(Color.tripBlue),
                NSAttributedString.Key.paragraphStyle: style
            ]
            
            UINavigationBar
                .appearance()
                .titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(Color.tripBlue)]
                    
        FirebaseApp.configure()
        
        return true
    }
}
