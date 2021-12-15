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
    
    func buttonFrame() -> some View {
        self.frame(height: LayoutMetrics.Button.heightSize)
    }
    
    func homeTitleFrame() -> some View {
        self.frame(width: LayoutMetrics.Home.titleHorizontal,
                   alignment: .leading)
    }
        
    func allCentralizedFrame() -> some View {
        self.frame(width: LayoutMetrics.Design.Screen.maxWidth,
                   height: LayoutMetrics.Design.Screen.maxHeight,
                   alignment: .center)
    }
    
    func interactionTypeFrame() -> some View {
        self.frame(height: LayoutMetrics.Combination.InteractionType.height)
            .padding(LayoutMetrics.Combination.InteractionType.padding)
    }
    
    // MARK: - Styling
    
    func backgroundGradient(_ style: [Color]) -> some View {
        self.background(LinearGradient(colors: style,
                                       startPoint: .top,
                                       endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
    
    func dimShadow() -> some View {
        self.shadow(color: .universalBlack.opacity(0.3),
                    radius: 10, x: 0, y: 10)
    }
    
    func lightShadow() -> some View {
        self.shadow(color: .universalBlack.opacity(0.1),
                    radius: 10, x: 0, y: 4)
    }
    
    func tagStyleFontPadding() -> some View {
        self.font(Style.DisplayedFont.Tag.body)
            .padding(LayoutMetrics.Design.Padding.tag)
    }
    
    func navStatusBarStyle(color: Color) -> some View {
        self.preferredColorScheme(color == .universalWhite || color == .clear ? .dark : .light)
            .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Modifiers
    
    func tagSelected() -> some View {
        self.modifier(TagModifierSelected())
    }
    
    func tagNotSelected() -> some View {
        self.modifier(TagModifierNotSelected())
    }
    
    // MARK: - Alert
    
    func informationAlert(_ isPresented: Binding<Bool>) -> some View {
        self.alert(isPresented: isPresented, content: {
            Alert(title: Text(Localizable.Combination.Alert.title),
                  message: Text(Localizable.Combination.Alert.text),
                  dismissButton: .default(Text(Localizable.Combination.Alert.action)))
        })
    }
    
    func swipeBack(_ dragOffSet: GestureState<CGSize>, _ dimiss: @escaping () -> Void) -> some View {
        self.gesture(DragGesture().updating(dragOffSet, body: { value, _, _ in
            
            if value.startLocation.x < 20 && value.translation.width > 100 {
                dimiss()
            }}))

    }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}

}
