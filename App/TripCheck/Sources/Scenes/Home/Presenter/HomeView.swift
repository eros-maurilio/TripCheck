import SwiftUI

struct HomeView: View {
    @ObservedObject var model = ContentViewModel()
    @State var isSelected = false
    @State var isSelected2 = true
    @State private var gradient = [Color.homeTop, Color.homeBottom]
    @State var opacityStyle: CGFloat = 0
    @State var substances = [String]()
    @State var isShowing = false
    @Namespace var botID
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
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
                
                FlexibleView(data: model.substances,
                             spacing: LayoutMetrics.Design.Padding.standard,
                             alignment: model.alignment) { item in
                    Button {
                        substanceSelection(name: item)
                        withAnimation {
                            if substances.count == 2 {
                                isShowing = true
                            } else {
                                isShowing = false
                            }
                        }
                    } label: {
                        TagView(substance: item, isSelected: substances.contains(item) ? $isSelected2 : $isSelected)
                    }
                }
                .standardHorizontalPadding()
                .standardBottomPadding()
                
                if isShowing {
                    CombinationButtonView(substances: $substances)
                        .frame(height: UIScreen.main.bounds.size.height / 16)
                        .id(botID)
                        .standardBottomPadding()
                        .standardHorizontalPadding()
                        .onAppear {
                            withAnimation {
                                value.scrollTo(botID, anchor: .bottom)
                            }
                        }
                }
            }
        }
        .backgroundGradient(Style.Gradient.home)
        .overlay(
            VStack {
                Spacer()
                Rectangle()
                    .fill(LinearGradient(colors: Style.BottomGradient.home, startPoint: .top, endPoint: .bottom))
                    .frame(width: UIScreen.main.bounds.size.width, height: 60, alignment: .bottom)
            }
                .edgesIgnoringSafeArea(.all))
        .navigationTitle(Localizable.Home.Title.text)
    }
    
    func substanceSelection(name: String) {
        if substances.contains(name) {
            substances = substances.filter {$0 != name}
            withAnimation {
                opacityStyle = 0
            }
            return
        }
        
        if substances.count == 2 {
            substances.remove(at: 0)
            print(substances)
        }
        
        if substances.count < 2 {
            substances.append(name)
            print(substances)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
