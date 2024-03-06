//
//  AddItemView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import SwiftUI

struct AddItemView: View {
    @StateObject var viewModel = AddItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .foregroundStyle(Color.black)
                .padding(.top, 50)
            Form {
                // fixme add a dropdown to select which category it goes in
                // for now, all items will go in one category
                
                // item name
                TextField("Item name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .foregroundStyle(Color.black)
                
                // button
                FormButton(title: "Add", background: Color.pink) {
                    if viewModel.canSave {
                        viewModel.addItem()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please enter a name"))
            }
        }
    }
}

#Preview {
    AddItemView(newItemPresented: Binding(get: {
        return true
    }, set: {_ in
        
    }))
}
