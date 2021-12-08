import SwiftUI

struct HomeView: View {
    @ObservedObject var model = HomeViewModel()
    @State var isSelected = false
    @State var isSelected2 = true
    @State var substances = [String]()
    @State var isShowing = false
    @Namespace var botID
    @State var typeOf = TypeOf() // FIXME: this is not my place
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                titles

                tags
                
                if isShowing {
                    button
                        .onAppear {
                            withAnimation {
                                value.scrollTo(botID, anchor: .bottom)
                            }
                        }
                }
            }
        }
        .backgroundGradient(Style.Gradient.home)
        .bottomGradient(Style.Gradient.home)
        .navigationTitle(Localizable.Home.Title.text)
    }
    
    func substanceSelection(name: String) {
        if substances.contains(name) {
            substances = substances.filter {$0 != name}
            return
        }
        
        if substances.count == 2 {
            substances.removeFirst()
            print(substances)
        }
        
        if substances.count < 2 {
            substances.append(name)
            print(substances)
        }
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
        FlexibleView(data: typeOf.substances) { item in
            Button {
                model.substanceSelection(substance: item)
                withAnimation {
                    if model.selectedSubstances.count == 2 {
                        isShowing = true
                    } else {
                        isShowing = false
                    }
                }
            } label: {
                TagView(substance: item, isSelected: model.selectedSubstances.contains(item) ? $isSelected2 : $isSelected)
            }
        }
                     .standardHorizontalPadding()
                     .standardBottomPadding()
    }
    
    private var button: some View {
        CombinationButtonView(substances: $model.selectedSubstances)
            .frame(height: UIScreen.main.bounds.size.height / 16)
            .id(botID)
            .standardBottomPadding()
            .standardHorizontalPadding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
