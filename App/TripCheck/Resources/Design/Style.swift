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
        
        enum background {
            static let selected: some View = Color.tripBlue.cornerRadius(LayoutMetrics.Design.Style.cornerRadius)
            static let notSelect: some View = Color.white.cornerRadius(LayoutMetrics.Design.Style.cornerRadius)
        }
    }
    
    enum DisplayedFont {
        enum Home {
            static let subtitle: Font = .publicSans(.medium,
                                                    size: LayoutMetrics.Design.Text.body,
                                                    relativeTo: .body)
        }
        
        enum Tag {
            static let body: Font = .publicSans(.regular,
                                                size: LayoutMetrics.Design.Text.body,
                                                relativeTo: .body)
        }
        
        enum Button {
            static let callToAction: Font = .publicSans(.bold,
                                                        size: 14,
                                                        relativeTo: .subheadline)
        }
        
        enum Combination {
            static let interactionTypeTitle: Font = .publicSans(.bold,
                                                                size:LayoutMetrics.Design.Text.extraLargeTitle,
                                                                relativeTo: .title)
            
            static let title: Font = .publicSans(.semiBold,
                                                 size: LayoutMetrics.Design.Text.title,
                                                 relativeTo: .title2)
            enum Note {
                
                static let title: Font = .publicSans(.bold,
                                                     size: LayoutMetrics.Design.Text.headline,
                                                     relativeTo: .headline)
                
                static let body: Font = .publicSans(.regular,
                                                    size: LayoutMetrics.Design.Text.body,
                                                    relativeTo: .body)
            }
        }
        
        enum NavigationButtons {
            static var size: Font = .system(size: LayoutMetrics.Design.Text.headline,
                                            weight: .medium,
                                            design: .default)
        }
    }
}
