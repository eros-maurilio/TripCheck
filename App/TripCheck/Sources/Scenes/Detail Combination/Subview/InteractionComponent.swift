import SwiftUI

struct InteractionComponent: View {
    
    // MARK: - Atributes
    
    var icon: Image
    var status: String
    var note: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            interactionBlock
            noteBlock
            
        }
        .padding(.bottom, LayoutMetrics.Design.Padding.bottom)
    }
    
    // MARK: - SubViews

    private var interactionBlock: some View {
        HStack(alignment: .top) {
            icon
                .resizable()
                .scaledToFit()
            
            Text(status)
                .fixedSize(horizontal: false, vertical: true)
                .font(Style.DisplayedFont.Combination.interactionTypeTitle)
                .padding(LayoutMetrics.Design.Padding.interactionTypeTitle)
            
            Spacer()
        }
        .interactionTypeFrame()
    }
    
    private var noteBlock: some View {
        VStack(alignment: .leading, spacing: LayoutMetrics.Design.Padding.standard) {
            Text(Localizable.Combination.Note.title)
                .font(Style.DisplayedFont.Combination.Note.title)
            
            Text(note ?? Localizable.Combination.Note.empty)
                .font(Style.DisplayedFont.Combination.Note.body)
                .lineSpacing(LayoutMetrics.Design.Text.standarLineSpacing)
        }
    }
}
