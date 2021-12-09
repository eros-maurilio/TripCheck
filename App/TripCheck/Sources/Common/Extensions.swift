import Foundation
import SwiftUI

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension View {
    func standardHorizontalPadding() -> some View {
        self.padding(.horizontal, LayoutMetrics.Design.Padding.standard)
    }
    
    func standardBottomPadding() -> some View {
        self.padding(.bottom, LayoutMetrics.Design.Padding.bottom)
    }
    
    func homeTitleFrame() -> some View {
        self.frame(width: LayoutMetrics.Home.titleHorizontal, alignment: .leading)
    }
    
    func backgroundGradient(_ style: [Color]) -> some View {
        self.background(LinearGradient(colors: style, startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
    
    func scroll(_ currentPosition: ScrollViewProxy,to id: Namespace.ID) -> some View {
        self.onAppear {
            withAnimation {
                currentPosition.scrollTo(id, anchor: .bottom)
            }
        }
    }
    
    func buttonFrame() -> some View {
        self.frame(height: LayoutMetrics.Button.heightSize)
    }
}
