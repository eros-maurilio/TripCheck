import SwiftUI

struct TagModifierSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Style.TagColor.Text.selected)
            .tagStyleFontPadding()
            .background(Style.TagColor.background.selected)
    }
}

struct TagModifierNotSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Style.TagColor.Text.defaut)
            .tagStyleFontPadding()
            .background(Style.TagColor.background.notSelect)
    }
}
