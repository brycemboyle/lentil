//
//  LoginViewViewModel.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // try to log in
        Auth.auth().signIn(withEmail: email, password: password)
     
    }
    
    private func validate() -> Bool {
        print("validating...")
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                errorMessage = "Please fill in all fields"
                return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        return true
    }
}
