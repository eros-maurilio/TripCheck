//
//  DetailCombinationView.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 08/10/21.
//
import SwiftUI

struct DetailCombinationView: View {
    @State private var icons = ["death", "alert", "heart", "decrease", "sinergy", "stable"]
    @State private var gradient = [Color.gradientHomeTop, Color.gradientHomeBot]
    @State var substances: [String]
    @State var foreColor: Color = .clear
    @StateObject var jsonModel = JSONInteractionViewModel()
    @State var bottomColor: Color = .clear
    @State var topColor: Color = .clear
    @State var isShowingAlert = false
    var message = """
        The information available here is for quick reference, it is recommended that further research be done so that you can make the best decision.
        Furthermore, all data comes from Tripsit.
        """
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
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
                
                VStack {
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
                                    topColor = .gradientDangerTop
                                    bottomColor = .gradientDangerBot
                                }
                            
                        case "Caution":
                            Components(icon: $icons[1], status: item.status!, note: item.note)
                                .foregroundColor(.black)
                                .onAppear {
                                    gradient = [Color.gradientCautionTop, Color.gradientCautionBot]
                                    foreColor = .black
                                    topColor = .gradientCautionTop
                                    bottomColor = .gradientCautionBot
                                }
                            
                        case "Unsafe":
                            Components(icon: $icons[2], status: item.status!, note: item.note)
                                .foregroundColor(.white)
                                .onAppear {
                                    gradient = [Color.gradientUnsafeTop, Color.gradientUnsafeBot]
                                    foreColor = .white
                                    topColor = .gradientUnsafeTop
                                    bottomColor = .gradientUnsafeBot
                                }
                            
                        case "Low Risk & Decrease":
                            Components(icon: $icons[3], status: item.status!, note: item.note)
                                .foregroundColor(.black)
                                .onAppear {
                                    gradient = [Color.gradientLowRiskDecreaseTop, Color.gradientLowRiskDecreaseTop]
                                    foreColor = .black
                                    topColor = .gradientLowRiskDecreaseTop
                                    bottomColor = .gradientLowRiskDecreaseBot
                                }
                            
                        case "Low Risk & Synergy":
                            Components(icon: $icons[4], status: item.status!, note: item.note)
                                .foregroundColor(.white)
                                .onAppear {
                                    gradient = [Color.gradientLowRiskSinergyTop, Color.gradientLowRisKSinergyBot]
                                    foreColor = .white
                                    topColor = .gradientLowRiskSinergyTop
                                    bottomColor = .gradientLowRisKSinergyBot
                                }
                            
                        case "Low Risk & No Synergy":
                            Components(icon: $icons[5], status: item.status!, note: item.note)
                                .foregroundColor(.black)
                                .onAppear {
                                    gradient = [Color.gradientLowRiskNoSinergyTop, Color.gradientLowRisKNoSinergyBot]
                                    foreColor = .black
                                    topColor = .gradientLowRiskNoSinergyTop
                                    bottomColor = .gradientLowRisKNoSinergyBot
                                }
                            
                        default:
                            Text("No informations avaliable")
                            
                        }
                    }
                }
            }
        }
        .alert(isPresented: $isShowingAlert, content: {
            Alert(title: Text("Important"), message: Text(message), dismissButton: .default(Text("OK")))
        })
        .padding(.horizontal, 40)
        .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .overlay(
            VStack {
                Spacer()
                Rectangle()
                    .fill(LinearGradient(colors: [topColor.opacity(0.1), bottomColor], startPoint: .top, endPoint: .bottom))
                    .frame(width: UIScreen.main.bounds.size.width, height: 60, alignment: .bottom)
            }
                .edgesIgnoringSafeArea(.all))
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            
            if(value.startLocation.x < 20 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }
        }))
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(foreColor == .white ? .dark : .light)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                    })
                    Spacer()
                    Button {
                        isShowingAlert = true
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
                .foregroundColor(foreColor)
                .font(.system(size: 17, weight: .medium, design: .default))
            }
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
            
            Text(note ?? "There is no more information available.")
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
