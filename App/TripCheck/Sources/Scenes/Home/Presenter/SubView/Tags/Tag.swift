import SwiftUI

struct Tag: View {
    var substance: String
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Image(systemName: Strings.Sf.Symbols.selected)
                Text(verbatim: substance)
            }
            .tagSelected()
            
        } else {
            VStack {
                Text(verbatim: substance)
            }
            .tagNotSelected()
        }
    }
}
