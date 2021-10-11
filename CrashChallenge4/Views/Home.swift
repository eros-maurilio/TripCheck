////
////  Home.swift
////  CrashChallenge4
////
////  Created by Eros Maurilio on 10/10/21.
////
//
//import SwiftUI
//
//struct Home: View {
//    @StateObject var jsonModel = JSONInteractionViewModel()
//    @Environment(\.managedObjectContext) var context
//
//    @FetchRequest(entity: SubstanceCombination.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \SubstanceCombination.interactionCategoryA, ascending: true)]) var results: FetchedResults<SubstanceCombination>
//
//    var body: some View {
//        VStack{
//
//            if results.isEmpty {
//                if jsonModel.data!.isEmpty {
//                    ProgressView()
//                        .onAppear {
//                            jsonModel.fetchData(context: <#T##NSManagedObjectContext#>, subsA: <#T##String#>, subsB: <#T##String#>)
//                        }
//
//                } else {
//                    List(jsonModel.data!, id: \.self) { interactions in
//                        Text(interactions.status ?? "1")
//                        Text(interactions.note ?? "2")
//                    }
//                }
//            }
//
//            else {
//                List(results) { interactions in
//                    Text(interactions.status ?? "1")
//                    Text(interactions.note ?? "2")
//                }
//            }
//        }
//    }
//}
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
