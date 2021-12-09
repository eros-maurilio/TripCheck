import SwiftUI

struct HomeView: View {
    @ObservedObject var model = HomeViewModel()
    @Namespace var bottomPostion
    
    var body: some View {
        ScrollView {
            ScrollViewReader { view in
                
                titles

                tags
                
                if model.buttonState {
                    button
                        .scroll(view, to: bottomPostion)
                }
            }
        }
        .backgroundGradient(Style.Gradient.home)
        .navigationTitle(Localizable.Home.Title.text)
    }
    
    private var titles: some View {
        VStack(alignment: .leading, spacing: LayoutMetrics.Design.Padding.standard) {
            Text(Localizable.Home.Title.text)
                .font(.publicSans(.bold, size: LayoutMetrics.Design.Text.largeTitle, relativeTo: .title))
                .foregroundColor(.tripBlue)
                .padding(.top, -50) // FIXME: Coordinators?
            
            Text(Localizable.Home.Subtitle.text)
                .font(.publicSans(.medium, size: LayoutMetrics.Design.Text.body, relativeTo: .body))
        }
        .homeTitleFrame()
        .standardBottomPadding()
    }
    
    private var tags: some View {
        FlexibleView(data: model.substancesList) { item in
            Button {
                model.substanceSelection(substance: item)
                withAnimation { model.showButton() }
                
            } label: {
                TagView(substance: item, isSelected: model.selectedSubstances.contains(item))
            }
        }
                     .standardHorizontalPadding()
                     .standardBottomPadding()
    }
    
    private var button: some View {
        CombinationButtonView(substances: $model.selectedSubstances)
            .buttonFrame()
            .standardBottomPadding()
            .standardHorizontalPadding()
            .id(bottomPostion)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
