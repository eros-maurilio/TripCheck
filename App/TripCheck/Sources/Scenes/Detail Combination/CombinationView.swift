import SwiftUI

struct CombinationView<ViewModelType>: View where ViewModelType: CombinationViewModelProtocol {
    @ObservedObject var viewModel: ViewModelType
    @State private var icons = ["death", "alert", "heart", "decrease", "sinergy", "stable"]
    @State private var gradient = [Color.homeTop, Color.homeBottom]
    @State var foreColor: Color = .clear
    @State var bottomColor: Color = .clear
    @State var topColor: Color = .clear
    @State var isShowingAlert = false
    @State var bool = true
    var message = """
        The information available here is for quick reference, it is recommended that further research be done so that you can make the best decision.
        Furthermore, all data comes from Tripsit.
        """
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if viewModel.combination.isEmpty {
                VStack(alignment: .center) {
                    ProgressView()
                        .padding(.bottom, 200)


                }
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom))
                
            } else {
                
                VStack {
                    ForEach(viewModel.combination, id: \.self) { item in
                        let currentNotice = item.status

                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(item.interactionCategoryA) +")
                                Text("\(item.interactionCategoryB)")
                            }
                            .foregroundColor(foreColor)
                            .font(.publicSans(.semiBold, size: 24, relativeTo: .title)) // TODO: Change size to metrics

                            Spacer()
                        }
                        
                        Text("dal;kd;alskd;as \(item.status)")

                        switch currentNotice {
                        case "Dangerous":
                            Components(icon: $icons[0], status: item.status.uppercased(), note: item.note)
                                .foregroundColor(.white)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .white
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Caution":
                            Components(icon: $icons[1], status: item.status, note: item.note)
                                .foregroundColor(.black)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .black
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Unsafe":
                            Components(icon: $icons[2], status: item.status, note: item.note)
                                .foregroundColor(.white)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .white
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Low Risk & Decrease":
                            Components(icon: $icons[3], status: item.status, note: item.note)
                                .foregroundColor(.black)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .black
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Low Risk & Synergy":
                            Components(icon: $icons[4], status: item.status, note: item.note)
                                .foregroundColor(.white)
                                .onAppear {
                                    gradient = [Color.tripBlue, Color.tripBlue]
                                    foreColor = .white
                                    topColor = .tripBlue
                                    bottomColor = .tripBlue
                                }

                        case "Low Risk & No Synergy":
                            Components(icon: $icons[5], status: item.status, note: item.note)
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
            .font(.publicSans(.semiBold, size: 24, relativeTo: .title)) // TODO: Change size to metrics
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
