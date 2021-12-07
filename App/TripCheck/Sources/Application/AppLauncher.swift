import SwiftUI

@main
struct AppLauncher: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Application()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}
