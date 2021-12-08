import SwiftUI

enum Style {
    enum Gradient {
        static let home: [Color] = [.homeTop, .homeBottom]
    }
    
    enum BottomGradient {
        static let home:  [Color] = [.homeTop.opacity(0.01), .homeBottom]
    }
}
