//
//  FlexibleTagView.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 09/10/21.
//

import SwiftUI

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    @State private var alignmentIndex = 0
    private let alignments: [HorizontalAlignment] = [.leading, .center, .trailing]
    private var alignment: HorizontalAlignment {
        alignments[alignmentIndex]
    }
    let content: (Data.Element) -> Content
    @State private var availableWidth: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
            Color.clear
                .frame(height: 1)
                .readSize { size in
                    availableWidth = size.width
                }
            
            AFlexibleView(
                availableWidth: availableWidth,
                data: data,
                content: content,
                alignment: alignment
            )
        }
    }
}


