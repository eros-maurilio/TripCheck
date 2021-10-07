//
//  TagView.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 07/10/21.
//

import SwiftUI

struct TagView: View {
    @State private var substance = "Benzodiazepine"
    @State private var isSelected = false
    
    var body: some View {
        if isSelected {
            HStack {
                Image(systemName: "checkmark")
                Text("\(substance)")
            }
            .tagSelected()
        } else {
            VStack {
                Text("\(substance)")
            }
            .tagNotSelected()
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
            .previewLayout(.fixed(width: 200, height: 150))

    }
}
