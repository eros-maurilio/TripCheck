import SwiftUI

extension View {
    
    // MARK: - Reader
    
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
      background(
        GeometryReader { geometryProxy in
          Color.clear
            .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
        }
      )
      .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }    
    
    // MARK: - Padding
    
    func standardHorizontalPadding() -> some View {
        self.padding(.horizontal, LayoutMetrics.Design.Padding.standard)
    }
    
    func standardBottomPadding() -> some View {
        self.padding(.bottom, LayoutMetrics.Design.Padding.bottom)
    }
    
    // MARK: - Frames
    
    func homeTitleFrame() -> some View {
        self.frame(width: LayoutMetrics.Home.titleHorizontal, alignment: .leading)
    }
    
    func buttonFrame() -> some View {
        self.frame(height: LayoutMetrics.Button.heightSize)
    }
    
    // MARK: - Styling
    
    func backgroundGradient(_ style: [Color]) -> some View {
        self.background(LinearGradient(colors: style, startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
    
    func dimShadow() -> some View {
        self.shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
    }
    
    func lightShadow() -> some View {
        self.shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
    }
    
    // MARK: - Modifiers
    
    func tagSelected() -> some View {
        self.modifier(TagModifierSelected())
    }
    
    func tagNotSelected() -> some View {
        self.modifier(TagModifierNotSelected())
    }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
