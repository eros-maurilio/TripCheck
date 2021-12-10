import SwiftUI

enum Style {
    enum Gradient {
        static let home: [Color] = [.homeTop, .homeBottom]
    }
    
    enum BottomGradient {
        static let home:  [Color] = [.homeTop.opacity(0.01), .homeBottom]
    }
    
    enum TagColor {
        enum Text {
            static let defaut: Color = .black.opacity(0.6)
            static let selected: Color = .white
        }
    }
    
    enum DisplayedFont {
        enum Tag {
            static let body: Font = .publicSans(.regular,
                                                size: LayoutMetrics.Design.Text.body,
                                                relativeTo: .body)
        }
        
        enum Home {
            static let subtitle: Font = .publicSans(.medium,
                                                    size: LayoutMetrics.Design.Text.body,
                                                    relativeTo: .body)
        }
    }
}
