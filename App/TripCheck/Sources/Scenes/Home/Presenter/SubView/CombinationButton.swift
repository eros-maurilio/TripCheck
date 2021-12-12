import SwiftUI

struct CombinationButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                
                Image.symptom
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, LayoutMetrics.Design.Padding.buttonIcon)
                
                Text(Localizable.Home.Button.text)
                    .font(Style.DisplayedFont.Button.callToAction)
                
                Spacer()
            }
            .foregroundColor(.white)
            .background(Color.tripBlue)
            .cornerRadius(LayoutMetrics.Design.Style.cornerRadius)
        }
    }
}
