import SwiftUI

struct HomeView<ViewModelType>: View where ViewModelType: HomeViewModelProtocol {
    @ObservedObject var viewModel: ViewModelType
    
    // MARK: - View
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                titles
                tags
            }
            .backgroundGradient(Style.Gradient.home)
            .zIndex(Style.zIndex.back)
            
            if viewModel.isTheButtonVisible { buttonAppears }
            
        }
        .navigationTitle(Localizable.Home.Title.text)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    // MARK: - Subviewa
    
    private var titles: some View {
        VStack(alignment: .leading,
               spacing: LayoutMetrics.Design.Padding.standard) {
            
            Text(Localizable.Home.Subtitle.text)
                .homeTitleFrame()
                .standardBottomPadding()
                .font(Style.DisplayedFont.Home.subtitle)
                .foregroundColor(.universalBlack)
        }
    }
    
    private var tags: some View {
        VStack {
            FlexibleView(data: viewModel.substancesList) { item in
                Button {
                    viewModel.substanceSelection(substance: item)
                    withAnimation { viewModel.showButton() }
                    
                } label: {
                    Tag(substance: item, isSelected: viewModel.selectedSubstances.contains(item))
                        .lightShadow()
                }
            }
        }
        .standardHorizontalPadding()
        .standardBottomPadding()
    }
    
    private var buttonAppears: some View {
        ZStack {
            NavigationLink(destination:
                            InteractionView(viewModel: InteractionViewModel(substances: viewModel.selectedSubstances)),
                           isActive: $viewModel.pushView) {
                EmptyView()
            }
            .hidden()
            
            CombinationButton { viewModel.executePushView() }
            .buttonFrame()
            .standardHorizontalPadding()
            .standardBottomPadding()
            .dimShadow()
        }
        .zIndex(Style.zIndex.front)
    }
}
