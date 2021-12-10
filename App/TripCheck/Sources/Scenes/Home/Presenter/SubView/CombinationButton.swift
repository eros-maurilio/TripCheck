import SwiftUI

struct CombinationButton: View {
    @Binding var substances: [String]

    var body: some View {
        NavigationLink {
            DetailCombinationView(substances: substances)
        } label: {
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
