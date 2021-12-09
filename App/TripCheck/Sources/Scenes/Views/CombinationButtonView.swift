//
//  CombinationButtonView.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 07/10/21.
//

import SwiftUI

struct CombinationButtonView: View {
    @Binding var substances: [String]

    var body: some View {
        NavigationLink {
            DetailCombinationView(substances: substances)
        } label: {
            HStack {
                Spacer()
                Image("symptom")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                Text("Trip Check")
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .background(Color.tripBlue)
            .cornerRadius(5)
        }
        
    }
}

//struct CombinationButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        CombinationButtonView()
//            .frame(width: 350, height: 40)
//            .previewLayout(.fixed(width: 390, height: 150))
//
//    }
//}