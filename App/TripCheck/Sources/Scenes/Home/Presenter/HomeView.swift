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
            
            if viewModel.isTheButtonVisible { buttonAppears }
            
        }
        .navigationTitle(Localizable.Home.Title.text)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    // MARK: Subviewa
    
    private var titles: some View {
        VStack(alignment: .leading,
               spacing: LayoutMetrics.Design.Padding.standard) {
            
            Text(Localizable.Home.Subtitle.text)
                .homeTitleFrame()
                .standardBottomPadding()
                .font(.publicSans(.medium,
                                  size: LayoutMetrics.Design.Text.body,
                                  relativeTo: .body))
        }
    }
    
    private var tags: some View {
        VStack {
            FlexibleView(data: viewModel.substancesList) { item in
                Button {
                    viewModel.substanceSelection(substance: item)
                    withAnimation { viewModel.showButton() }
                    
                } label: {
                    TagView(substance: item, isSelected: viewModel.selectedSubstances.contains(item))
                        .lightShadow()
                }
            }
        }
        .standardHorizontalPadding()
        .standardBottomPadding()
    }
    
    private var buttonAppears: some View {
        CombinationButtonView(substances: $viewModel.selectedSubstances)
            .buttonFrame()
            .standardHorizontalPadding()
            .standardBottomPadding()
            .dimShadow()
    }
}

// MARK: - SwiftUI Preview

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
#endif
