import UIKit

enum LayoutMetrics {
    enum Home {
        static let titleHorizontal = UIScreen.main.bounds.width - 60
    }
    
    enum Button {
        static let heightSize = (UIScreen.main.bounds.height / 16)
    }
    
    enum Design {
        enum Padding {
            static let standard: CGFloat = 20
            static let bottom: CGFloat = 30
            static let buttonIcon: CGFloat = 10
            static let tag: CGFloat = 10
        }
        
        enum Style {
            static let cornerRadius: CGFloat = 5
        }
        
        enum Text {
            static let largeTitle: CGFloat = 34
            static let extraLargeTitle: CGFloat = 36
            static let body: CGFloat = 17
            static let headline: CGFloat = 18
            static let title: CGFloat = 24
        }
        
        enum Screen {
            static let maxWidth = UIScreen.main.bounds.width
            static let maxHeight = UIScreen.main.bounds.height
        }
    }
}
