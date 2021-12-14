import SwiftUI

struct NavButtons: View {
    var leadingButtonAction: () -> Void
    var trailingButtonAction: () -> Void
    var color: Color
    
    var body: some View {
            HStack {
                Button(action: leadingButtonAction) {
                    Image(systemName: Strings.Sf.Symbols.back)
                }
                
                Spacer()
                
                Button(action: trailingButtonAction) {
                    Image(systemName: Strings.Sf.Symbols.info)
                }
            }
            .foregroundColor(color)
            .font(Style.DisplayedFont.NavigationButtons.size)
    }
}
