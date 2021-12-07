import SwiftUI

@main
struct AppLauncher: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Application()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}
