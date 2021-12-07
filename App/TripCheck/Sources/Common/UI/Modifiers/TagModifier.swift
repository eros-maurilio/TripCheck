//
//  TagModifier.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 07/10/21.
//

import Foundation
import SwiftUI

struct TagModifierSelected: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .scaledFont(name: PublicSans.regular.rawValue, size: 17)
            .padding(10)
            .background(Color.deepBlue.cornerRadius(5))
            .shadow(color: .shadowColor.opacity(0.15), radius: 10, x: 0, y: 4)
    }
}

struct TagModifierNotSelected: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black.opacity(0.6))
            .scaledFont(name: PublicSans.regular.rawValue, size: 17)
            .padding(10)
            .background(Color.white.cornerRadius(5))
            .shadow(color: .shadowColor.opacity(0.15), radius: 10, x: 0, y: 4)
    }
}

extension View {
    func tagSelected() -> some View {
        self.modifier(TagModifierSelected())
    }
    
    func tagNotSelected() -> some View {
        self.modifier(TagModifierNotSelected())
    }
}
