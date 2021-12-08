//
//  _FlexibleView.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 09/10/21.
//

import SwiftUI

struct AFlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
  let availableWidth: CGFloat
  let data: Data
   private let spacing: CGFloat = LayoutMetrics.Design.Padding.standard
    let content: (Data.Element) -> Content
    let alignment: HorizontalAlignment
  @State var elementsSize: [Data.Element: CGSize] = [:]

  var body : some View {
    VStack(alignment: alignment, spacing: spacing) {
      ForEach(computeRows(), id: \.self) { rowElements in
        HStack(spacing: spacing) {
          ForEach(rowElements, id: \.self) { element in
            content(element)
              .fixedSize()
              .readSize { size in
                elementsSize[element] = size
              }
          }
        }
      }
    }
  }

  func computeRows() -> [[Data.Element]] {
    var rows: [[Data.Element]] = [[]]
    var currentRow = 0
    var remainingWidth = availableWidth

    for element in data {
      let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]

      if remainingWidth - (elementSize.width + spacing) >= 0 {
        rows[currentRow].append(element)
      } else {
        currentRow += 1
        rows.append([element])
        remainingWidth = availableWidth
      }

      remainingWidth -= (elementSize.width + spacing)
    }

    return rows
  }
}
