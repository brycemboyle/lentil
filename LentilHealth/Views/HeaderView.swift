//
//  HeaderView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let background: Color
    let height: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background)
                .rotationEffect(Angle(degrees: 15))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundStyle(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y: height)
        Spacer()
    }
}

#Preview {
    HeaderView(title: "Title",
               subtitle: "Subtitle",
               background: .blue,
               height: -100)
}
