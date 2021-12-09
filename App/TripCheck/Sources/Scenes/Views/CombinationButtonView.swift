import SwiftUI

struct CombinationButtonView: View {
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
                    .font(.publicSans(.bold,
                                      size: 14,
                                      relativeTo: .subheadline))
                
                Spacer()
            }
            .foregroundColor(.white)
            .background(Color.tripBlue)
            .cornerRadius(LayoutMetrics.Design.Style.cornerRadius)
        }
        
    }
}
