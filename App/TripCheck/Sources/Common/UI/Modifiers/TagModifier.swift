import SwiftUI

struct TagModifierSelected: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Style.TagColor.Text.defaut)
            .font(Style.DisplayedFont.Tag.body)
            .padding(LayoutMetrics.Design.Padding.tag)
            .background(Color.tripBlue.cornerRadius(LayoutMetrics.Design.Style.cornerRadius))
    }
}

struct TagModifierNotSelected: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Style.TagColor.Text.defaut)
            .font(Style.DisplayedFont.Tag.body)
            .padding(LayoutMetrics.Design.Padding.tag)
            .background(Color.white.cornerRadius(LayoutMetrics.Design.Style.cornerRadius))
    }
}
