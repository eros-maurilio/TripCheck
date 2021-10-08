//
//  AgreeButtonView.swift
//  CrashChallenge4
//
//  Created by Eros Maurilio on 08/10/21.
//

import SwiftUI

struct AgreeButtonView: View {
    var body: some View {
        Button(action: {
        //action here
        }, label: {
            HStack {
                Spacer()
                Text("I read and understand the risks")
                Spacer()
            }
            .foregroundColor(.black)
        })
        .scaledFont(name: PublicSans.medium.rawValue, size: 14)
        .padding(.vertical, 12)
        .frame(width: .infinity)
        .background(Color("GradientHomeTop"))
        .cornerRadius(5)
        .shadow(color: .shadowColor.opacity(0.15), radius: 4, x: 0, y: 4)
    }
}

struct AgreeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AgreeButtonView()
            .previewLayout(.fixed(width: 500, height: 60))
            .frame(width: 400, height: 100)
            .background(Color.red)
    }
}
    