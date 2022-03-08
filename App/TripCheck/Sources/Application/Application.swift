import SwiftUI
import FirebaseAnalytics
import AppTrackingTransparency

struct Application: View {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        ZStack {
            HomeView(viewModel: HomeViewModel())
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .background:
                        debugPrint("im bg")
                    case .inactive:
                        debugPrint("im inactive")
                    case .active:
                        requestDataPermission()
                    @unknown default:
                        debugPrint("default")
                    }
                }
        }
    }
    
    func requestDataPermission() {
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
            switch status {
            case .authorized:
                Analytics.setUserProperty("true",
                                          forName: AnalyticsUserPropertyAllowAdPersonalizationSignals)
                Analytics.setAnalyticsCollectionEnabled(true)
                debugPrint("Authorized")
                
                debugPrint("Authorized")
            case .denied:
                
                Analytics.setUserProperty("false",
                                          forName: AnalyticsUserPropertyAllowAdPersonalizationSignals)
                Analytics.setAnalyticsCollectionEnabled(false)
                debugPrint("Denied")
                
                debugPrint("Denied")
            case .notDetermined:
                debugPrint("Not Determined")
            case .restricted:
                debugPrint("Restricted")
            @unknown default:
                debugPrint("Unknown")
            }
        })
    }
    
}

struct Application_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}
