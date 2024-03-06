//
//  FormButton.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import SwiftUI

struct FormButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                
                Text(title)
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    FormButton(title: "Value",
               background: .pink)
                {// action
                }
}
