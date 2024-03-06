//
//  AddItemViewViewModel.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class AddItemViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var showAlert = false
    
    init() {}
    
    func addItem() {
        guard canSave else {
            return
        }
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = Item(id: newId,
                           name: name,
                           isSelected: false)
        
        // save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("categories")
        // since i'm not making categories yet, just puttting them all
        // in one category with an id of 1
            .document("1")
            .collection("items")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
}
