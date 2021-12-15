import SwiftUI

struct CombinationView<ViewModelType>: View where ViewModelType: CombinationViewModelProtocol {
    @ObservedObject var viewModel: ViewModelType
    
    @State private var currentGradient = Style.Gradient.home
    @State var foreColor: Color = .clear
    @State var isShowingAlert = false
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            if viewModel.interactionType == nil {
                VStack(alignment: .center) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .tripBlue))
                }
                .navigationBarHidden(viewModel.interactionType == nil)
                .allCentralizedFrame()
                .backgroundGradient(currentGradient)
                
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Text("\(viewModel.drugA) +")
                        Text(viewModel.drugB)
                    }
                    .font(Style.DisplayedFont.Combination.title)
                    .frame(width: LayoutMetrics.Combination.titleHorizontal, alignment: .leading)

                        if let interactionType = viewModel.interactionType {
                            Components(icon: interactionType.icon,
                                       status: viewModel.processedData.status,
                                       note: viewModel.processedData.note)
                                .onAppear {
                                    currentGradient = interactionType.gradient
                                    foreColor = interactionType.foregroundColor
                                }
                            
                        } else {
                            Text("No informations avaliable")
                        }
                    
                }
                .foregroundColor(foreColor)
                .navigationBarBackButtonHidden(true)
                .informationAlert($isShowingAlert)
                .padding(.horizontal, 50)
                .backgroundGradient(currentGradient)
                .preferredColorScheme(foreColor == .white ? .dark : .light)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        NavButtons(leadingButtonAction: {
                            presentationMode.wrappedValue.dismiss()
                        }, trailingButtonAction: {
                            isShowingAlert = true
                        }, color: foreColor)
                    }
                }
            }
        }
    }
}

struct WarningType: View {
    var icon: Image
    var status: String
    
    var body: some View {
        HStack(alignment: .top) {
            icon
                .resizable()
                .scaledToFit()
            Text(status)
                .fixedSize(horizontal: false, vertical: true)
                .font(Style.DisplayedFont.Combination.interactionTypeTitle)
                .padding(.top, 5)
            Spacer()
        }
        .frame(height: 50)
        .padding(EdgeInsets(top: 70, leading: -6, bottom: 100, trailing: 0))
    }
}

struct Description: View {
    var note: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Note")
                .font(Style.DisplayedFont.Combination.Note.title)
                .padding(.bottom, 25)
            
            Text(note ?? Localizable.Combination.Note.empty)
                .font(Style.DisplayedFont.Combination.Note.body)
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

struct CombinationView_Previews: PreviewProvider {
    static var previews: some View {
        CombinationView(viewModel: CombinationViewModel(substances: ["Cocaine", "LSD"]))
    }
}
