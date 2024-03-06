//
//  RegisterView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Get trendy",
                       background: Color.orange,
                       height: 25)
            
            Form {
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                FormButton(title: "Create Account", background: .green) {
                        viewModel.register()
                    }
                    .padding()
            }
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
