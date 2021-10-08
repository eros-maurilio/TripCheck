////
////  SubstancesList.swift
////  CrashChallenge4
////
////  Created by Eros Maurilio on 08/10/21.
////
//
//import SwiftUI
//
//struct SubstancesList: View {
//    @State private var interaction: [DrugInteraction] = []
//    
//    var body: some View {
//        VStack {
//            Text($interaction.status)
//
//        }
//        .onAppear {
//            Api().getSubstancesInfo { response in
//                self.interaction = response
//            }
//    }
//    }
//}
//
//struct SubstancesList_Previews: PreviewProvider {
//    static var previews: some View {
//        SubstancesList()
//    }
//}
