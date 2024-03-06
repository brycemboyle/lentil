//
//  ItemView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import SwiftUI

struct CheckInItemView: View {
    @StateObject var viewModel = CheckInItemViewViewModel()
    let item: Item
    
    
    var body: some View {
        Button {
            // Action
            viewModel.toggleSelect(item: item)
            print("clicked")
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(item.isSelected ? Color.teal : Color.indigo)
                    
                    Text(item.name)
                        .foregroundStyle(Color.white)
                        .bold()
                }
                
                Spacer()
                
                // temporary. will eventually be shaded if selected
                Button {
                    
                } label: {
                    Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
                }
            }
        }
    }
}

#Preview {
    CheckInItemView(item: .init(id: "123",
                                name: "placeholder",
                                isSelected: false) )
}
