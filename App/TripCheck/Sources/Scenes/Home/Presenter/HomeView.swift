import SwiftUI

struct HomeView<ViewModelType>: View where ViewModelType: HomeViewModelProtocol {
    @ObservedObject var viewModel: ViewModelType
    @Namespace var bottomPostion
    
    var body: some View {
        ScrollView {
            ScrollViewReader { view in
                
                titles
                
                tags
                
                if viewModel.isTheButtonVisible { buttonAppears.scroll(view, to: bottomPostion) }
            }
        }
        .backgroundGradient(Style.Gradient.home)
        .navigationTitle(Localizable.Home.Title.text)
    }
    
    private var titles: some View {
        VStack(alignment: .leading,
               spacing: LayoutMetrics.Design.Padding.standard) {
            
            Text(Localizable.Home.Title.text)
                .foregroundColor(.tripBlue)
                .padding(.top, -50) // FIXME: Coordinators?
                .font(.publicSans(.bold,
                                  size: LayoutMetrics.Design.Text.largeTitle,
                                  relativeTo: .title))
            
            Text(Localizable.Home.Subtitle.text)
                .font(.publicSans(.medium,
                                  size: LayoutMetrics.Design.Text.body,
                                  relativeTo: .body))
        }
        .homeTitleFrame()
        .standardBottomPadding()
    }
    
    private var tags: some View {
        VStack {
            FlexibleView(data: viewModel.substancesList) { item in
                Button {
                    viewModel.substanceSelection(substance: item)
                    withAnimation { viewModel.showButton() }
                    
                } label: {
                    TagView(substance: item, isSelected: viewModel.selectedSubstances.contains(item))
                }
            }
        }
        .standardHorizontalPadding()
        .standardBottomPadding()
    }
    
    private var buttonAppears: some View {
        CombinationButtonView(substances: $viewModel.selectedSubstances)
            .buttonFrame()
            .standardBottomPadding()
            .standardHorizontalPadding()
            .id(bottomPostion)
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
#endif
