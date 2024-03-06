//
//  CheckInItemViewViewModel.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class CheckInItemViewViewModel: ObservableObject {
    init() {}
    
    // will need to use this function when clicking items for highlighting.
    // need to take those values that are selected when check in is submitted
    // and save them to database
    func toggleSelect(item: Item) {
        // have to copy bc item is immutable
        var itemCopy = item
        itemCopy.select(!item.isSelected)
        
    }
}
