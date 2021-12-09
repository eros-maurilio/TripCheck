import SwiftUI

struct Application: View {
    var body: some View {
        ZStack {
            HomeView(viewModel: HomeViewModel())
        }
    }
}

struct Application_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}
