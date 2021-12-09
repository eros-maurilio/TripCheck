//
//  TagView.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 07/10/21.
//

import SwiftUI

struct TagView: View {
    var substance: String
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Image(systemName: "checkmark")
                Text(verbatim: substance)
            }
            .tagSelected()
            .transition(.opacity)
            
        } else {
            VStack {
                Text(verbatim: substance)
            }
            .tagNotSelected()
            .transition(.opacity)

        }
    }
}

//struct TagView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagView()
//            .previewLayout(.fixed(width: 200, height: 150))
//
//    }
//}
