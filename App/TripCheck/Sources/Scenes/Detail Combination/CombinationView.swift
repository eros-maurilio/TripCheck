import SwiftUI

struct CombinationView<ViewModelType>: View where ViewModelType: CombinationViewModelProtocol {
    @ObservedObject var viewModel: ViewModelType
    
    @State private var gradient = [Color.homeTop, Color.homeBottom]
    @State var foreColor: Color = .clear
    @State var isShowingAlert = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
                        let item = viewModel.combination.first!
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(viewModel.drugA) +")
                                Text("\(viewModel.drugB)")
                            }
                            .foregroundColor(foreColor)
                            .font(.publicSans(.semiBold, size: 24, relativeTo: .title2))
                            
                            Spacer()
                        }
                        
                        if let status = viewModel.interactionType {
                            Components(icon: status.icon, status: item.status, note: item.note)
                                .foregroundColor(status.foregroundColor)
                                .onAppear {
                                    gradient = status.gradient
                                    foreColor = status.foregroundColor
                                }
                        } else {
                            Text("No informations avaliable")
                            
                        }
                    }
                }
                .informationAlert($isShowingAlert)
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
            
            Text(note ?? Localizable.Combination.Note.empty)
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
