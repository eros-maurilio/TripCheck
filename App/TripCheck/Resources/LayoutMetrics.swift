import UIKit

enum LayoutMetrics {
    enum Home {
        static let titleHorizontal = UIScreen.main.bounds.width - 60
    }
    
    enum Button {
        static let heightSize = UIScreen.main.bounds.height / 16
    }
    
    enum Design {
        enum Padding {
            static let standard: CGFloat = 20
            static let bottom: CGFloat = 30
        }
        
        enum Text {
            static let largeTitle: CGFloat = 34
            static let extraLargeTitle: CGFloat = 36
            static let body: CGFloat = 17
            static let headline: CGFloat = 18
            static let title: CGFloat = 24
        }
    }
}
