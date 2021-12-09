import SwiftUI

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    @State private var alignmentIndex = 0
    @State private var availableWidth: CGFloat = 0
    private var alignment: HorizontalAlignment { alignments[alignmentIndex] }
    private let alignments: [HorizontalAlignment] = [.leading, .center, .trailing]
    let data: Data
    let content: (Data.Element) -> Content
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
            Color.clear
                .frame(height: 1)
                .readSize { size in
                    availableWidth = size.width
                }
            
            FlexibleTagView(
                availableWidth: availableWidth,
                data: data,
                content: content,
                alignment: alignment
            )
        }
    }
}


