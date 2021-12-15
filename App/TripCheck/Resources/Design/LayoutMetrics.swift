import SwiftUI

enum LayoutMetrics {
    enum Home {
        static let titleHorizontal = UIScreen.main.bounds.width - 60
    }
    
    enum Button {
        static let heightSize = (UIScreen.main.bounds.height / 16)
    }
    
    enum Combination {
        static let titleHorizontal = UIScreen.main.bounds.width - 100
        
        enum InteractionType {
            static let height: CGFloat = 50
            static let padding = EdgeInsets(top: 100, leading: -6, bottom: 120, trailing: 0)

        }
    }
    
    enum Design {
        enum Padding {
            static let standard: CGFloat = 20
            static let bottom: CGFloat = 30
            static let buttonIcon: CGFloat = 10
            static let tag: CGFloat = 10
            static let interactionTypeTitle: CGFloat = 5
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
            static let standarLineSpacing: CGFloat = 6
        }
        
        enum Screen {
            static let maxWidth = UIScreen.main.bounds.width
            static let maxHeight = UIScreen.main.bounds.height
        }
    }
}
