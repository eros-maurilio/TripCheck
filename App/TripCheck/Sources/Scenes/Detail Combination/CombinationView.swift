import SwiftUI

struct CombinationView<ViewModelType>: View where ViewModelType: CombinationViewModelProtocol {
    @ObservedObject var viewModel: ViewModelType
    
    @State private var gradient = [Color.homeTop, Color.homeBottom]
    @State var foreColor: Color = .clear
    @State var bottomColor: Color = .clear
    @State var topColor: Color = .clear
    @State var isShowingAlert = false

    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            if viewModel.combination.isEmpty {
                VStack(alignment: .center) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .tripBlue))
                
                }
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
                .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom))
                .navigationBarHidden(viewModel.combination.isEmpty)
                
            } else {
                ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModel.combination, id: \.self) { item in
                        let currentNotice = item.status

                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(item.interactionCategoryA) +")
                                Text("\(item.interactionCategoryB)")
                            }
                            .foregroundColor(foreColor)
                            .font(.publicSans(.semiBold, size: 24, relativeTo: .title2))

                            Spacer()
                        }
                        
                        switch currentNotice {
                        case "Dangerous":
                            Components(icon: Image.death, status: item.status.uppercased(), note: item.note)
                                .foregroundColor(.white)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .white
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Caution":
                            Components(icon: Image.alert, status: item.status, note: item.note)
                                .foregroundColor(.black)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .black
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Unsafe":
                            Components(icon: Image.heart, status: item.status, note: item.note)
                                .foregroundColor(.white)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .white
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Low Risk & Decrease":
                            Components(icon: Image.decrease, status: item.status, note: item.note)
                                .foregroundColor(.black)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .black
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Low Risk & Synergy":
                            Components(icon: Image.sinergy, status: item.status, note: item.note)
                                .foregroundColor(.white)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .white
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Low Risk & No Synergy":
                            Components(icon: Image.decrease, status: item.status, note: item.note)
                                .foregroundColor(.black)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .black
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        default:
                            Text("No informations avaliable")

                        }
                    }
                }
                    
                }
                .alert(isPresented: $isShowingAlert, content: {
                    Alert(title: Text(Localizable.Combination.Alert.title), message: Text(Localizable.Combination.Alert.text), dismissButton: .default(Text("OK")))
                })
                .padding(.horizontal, 40)
                .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
                .preferredColorScheme(foreColor == .white ? .dark : .light)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isShowingAlert = true
                            } label: {
                                Image(systemName: Strings.Sf.Symbols.info)
                            }
                        .foregroundColor(foreColor)
                        .font(.system(size: 17, weight: .medium, design: .default))
                    }
                }

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
            .font(.publicSans(.semiBold, size: 24, relativeTo: .title)) // TODO: Change size to metrics
        }
    }
}
struct WarningType: View {
    var icon: Image
    var status: String?
    
    var body: some View {
        HStack(alignment: .top) {
            icon
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Text(status!)
                .fixedSize(horizontal: false, vertical: true)
                .font(.publicSans(.bold, size: 36, relativeTo: .title)) // TODO: Change size to metrics
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
                .font(.publicSans(.bold, size: 18, relativeTo: .title)) // TODO: Change size to metrics
                .padding(.bottom, 25)
            
            Text(note ?? "There is no more information available.")
                .font(.publicSans(.light, size: 17, relativeTo: .title)) // TODO: Change size to metrics
                .lineSpacing(6)
        }
    }
}

struct Components: View {
    var icon: Image
    var status: String
    var note: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            WarningType(icon: icon, status: status)
            
            Description(note: note)
                .padding(.bottom, 50)
            
        }
    }
}
