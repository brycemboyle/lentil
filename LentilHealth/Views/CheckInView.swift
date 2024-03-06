//
//  CheckInView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import SwiftUI

struct CheckInView: View {
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(Color.pink)
            VStack {
                Text("container.")
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
//                CheckInCategoryView()
            }
//            .padding(.bottom, 200)
        }
        .frame(width: UIScreen.main.bounds.width - 10,
               height: 600)
//        .offset(y: -100)
        Spacer()
        
    }
}

#Preview {
    CheckInView()
}
