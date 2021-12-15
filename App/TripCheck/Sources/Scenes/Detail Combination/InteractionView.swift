import SwiftUI

struct InteractionView<ViewModelType>: View where ViewModelType: InteractionViewModelProtocol {
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
                            InteractionComponent(icon: interactionType.icon,
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
