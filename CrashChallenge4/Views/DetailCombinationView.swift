//
//  DetailCombinationView.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 08/10/21.
//
//ProgressView()
//    .onAppear {
//        jsonModel.getInteraction(context: context)
import SwiftUI

struct DetailCombinationView: View {
    @State private var icons = ["death", "alert", "heart", "decrease", "sinergy", "stable"]
    @State private var gradient = [Color.gradientHomeTop, Color.gradientHomeBot]
    @State var substances: [String]
    @State var foreColor: Color = .white
    @StateObject var jsonModel = JSONInteractionViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if jsonModel.data == nil || jsonModel.data?.count == 0 {
                VStack(alignment: .center) {
                    ProgressView()
                        .padding(.bottom, 200)
                        .onAppear {
                            jsonModel.fetchData(subsA: substances[0], subsB: substances[1])
                        }
                }
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom))
                
            } else {
                ForEach(jsonModel.data!, id: \.self) { item in
                    let currentNotice = item.status
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(substances[0]) +")
                            Text("\(substances[1])")
                        }
                        .foregroundColor(foreColor)
                        .scaledFont(name: PublicSans.semiBold.rawValue, size: 24)
                        
                        Spacer()
                    }
                    
                    switch currentNotice {
                    case "Dangerous":
                        Components(icon: $icons[0], status: item.status!.uppercased(), note: item.note)
                            .foregroundColor(.white)
                            .onAppear {
                                gradient = [Color.gradientDangerTop, Color.gradientDangerBot]
                                foreColor = .white
                            }
                        
                    case "Caution":
                        Components(icon: $icons[1], status: item.status!, note: item.note)
                            .foregroundColor(.black)
                            .onAppear {
                                gradient = [Color.gradientCautionTop, Color.gradientCautionBot]
                                foreColor = .black
                            }
                        
                    case "Unsafe":
                        Components(icon: $icons[2], status: item.status!, note: item.note)
                            .foregroundColor(.white)
                            .onAppear {
                                gradient = [Color.gradientUnsafeTop, Color.gradientUnsafeBot]
                                foreColor = .white
                            }
                        
                    case "Low Risk & Decrease":
                        Components(icon: $icons[3], status: item.status!, note: item.note)
                            .foregroundColor(.black)
                            .onAppear {
                                gradient = [Color.gradientLowRiskDecreaseTop, Color.gradientLowRiskDecreaseTop]
                                foreColor = .black
                            }
                        
                    case "Low Risk & Synergy":
                        Components(icon: $icons[4], status: item.status!, note: item.note)
                            .foregroundColor(.white)
                            .onAppear {
                                gradient = [Color.gradientLowRiskSinergyTop, Color.gradientLowRisKSinergyBot]
                                foreColor = .white
                            }
                        
                    case "Low Risk & No Synergy":
                        Components(icon: $icons[5], status: item.status!, note: item.note)
                            .foregroundColor(.black)
                            .onAppear {
                                gradient = [Color.gradientLowRiskNoSinergyTop, Color.gradientLowRisKNoSinergyBot]
                                foreColor = .black
                            }
                        
                    default:
                        Text("No informations avaliable")
                        
                    }
                }
            }
            
        }
        .padding(.horizontal, 40)
        .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationTitle("\(substances[0]) + \(substances[1])")
    }
}

struct SubstancesName: View {
    var substance1: String
    var substance2: String
    
    var body: some View {
        Group {
            Text("\(substance1) +")
            Text("\(substance2)")
        }
        .scaledFont(name: PublicSans.semiBold.rawValue, size: 24)
    }
}

struct WarningType: View {
    @Binding var icon: String
    var status: String?
    
    var body: some View {
        HStack(alignment: .top) {
            Image(icon)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Text(status!)
                .fixedSize(horizontal: false, vertical: true)
                .font(.custom(PublicSans.bold.rawValue, size: 36))
                .padding(.top, 7)
            Spacer()
        }
        .frame(height: 48)
        .padding(EdgeInsets(top: 70, leading: -6, bottom: 100, trailing: 0))
    }
}

struct Description: View {
    var note: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Note")
                .scaledFont(name: PublicSans.bold.rawValue, size: 18)
                .padding(.bottom, 25)
            
            Text(note ?? "No information available")
                .scaledFont(name: PublicSans.light.rawValue, size: 17)
                .lineSpacing(6)
        }
    }
}

struct Components: View {
    @Binding var icon: String
    var status: String
    var note: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            WarningType(icon: $icon, status: status)
            
            Description(note: note)
                .padding(.bottom, 50)
            
        }
    }
}
