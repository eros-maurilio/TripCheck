//
//  DetailCombinationView.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 08/10/21.
//

import SwiftUI

struct DetailCombinationView: View {
    @State private var substance1 = "Alcohol"
    @State private var substance2 = "Benzodiazepine"
    @State private var icon = "death"
    @State private var alertType = "DANGEROUS"
    @State private var description = "Ethanol ingestion may potentiate the CNS effects of many benzodiazepines. The two substances potentiate each other strongly and unpredictably, very rapidly leading to unconsciousness. While unconscious, vomit aspiration is a risk if not placed in the recovery position. Blacking out and memory loss is almost certain."
    @State private var gradient = [Color.gradientDangerTop, Color.gradientDangerBot]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Group {
                    Text("\(substance1) +")
                    Text("\(substance2)")
                }
                .scaledFont(name: PublicSans.semiBold.rawValue, size: 24)
                
                HStack {
                    Image(icon)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    Text(alertType)
                        .font(.custom(PublicSans.bold.rawValue, size: 36))
                }
                .frame(height: 48)
                .padding(EdgeInsets(top: 100, leading: -8, bottom: 130, trailing: 0))
                
                Text("Description")
                    .scaledFont(name: PublicSans.bold.rawValue, size: 18)
                    .padding(.bottom, 25)
                Text(description)
                    .scaledFont(name: PublicSans.light.rawValue, size: 17)
                    .lineSpacing(6)
                    .padding(.bottom, 50)
                
                AgreeButtonView()
            }
            .padding(.top, 50)
            .padding(.horizontal, 40)
            .foregroundColor(.white)
        }
        .background(LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
}

struct DetailCombinationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCombinationView()
    }
}
