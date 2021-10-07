//
//  DynamicTextModifier.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 07/10/21.
//

import SwiftUI

@available(iOS 13, *)
struct DynamicTextModifier: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat
    
    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(DynamicTextModifier(name: name, size: size))
    }
}
