//
//  Item.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: String
    let name: String
    var isSelected: Bool
    
    mutating func select(_ state: Bool) {
        isSelected = state
    }
}

struct ItemResponse {
    let request: [Item]
}

struct MockItemData {
    static let sampleItem1 = Item(id: "321", name: "slept >8 hours", isSelected: false)
    static let sampleItem2 = Item(id: "4321", name: "slept >6 hours", isSelected: false)
    
    static let itemList = [sampleItem1, sampleItem2]
}
