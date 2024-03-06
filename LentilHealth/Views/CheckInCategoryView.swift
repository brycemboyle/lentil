//
//  CheckInCategoryView.swift
//  LentilHealth
//
//  Created by Bryce Boyle on 1/26/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct CheckInCategoryView: View {
    @StateObject var viewModel = CheckInCategoryViewViewModel()
    @State private var itemz: [Item] = [] // FIXME move this somewhere else??? too tired
    @FirestoreQuery var items: [Item]
    
    init(userId: String, categoryId: String, selectedItems: Array<String>) {
        // path to items:
        // users/<id>/categories/1/items/<entries>
        // fixme fix hardcoded "1" for categories and do a query like this
        // in check in page view to get category and display category name
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/categories/\(categoryId)/items"
        )
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(Color.blue)
//            VStack {
//                List(items) { item in
//                    CheckInItemView(item: item)
//                    
//                }
//                .listStyle(PlainListStyle())
//            }
            
            
            
            ScrollView {
                LazyVStack (pinnedViews: [.sectionHeaders]) {
                    Section {
//                        ForEach(items) { item in
//                            CheckInItemView(item: item)
//                        }
                        ForEach(MockItemData.itemList) { item in
                            Text(item.name)
                        }
//                        List(MockItemData.itemList, id: \.id) {
//                            item in Text(item.name)
//                        }
                    } header: {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 0)
                                    .foregroundStyle(Color.green)
                                HStack {
                                    Text("Category name")
                                        .font(.system(size: 32))
                                    Button {
                                        // action
                                        viewModel.showingAddItemView = true
                                    } label: {
                                        Image(systemName: "plus")
                                    }
                                }
                                .sheet(isPresented: $viewModel.showingAddItemView) {
                                    AddItemView(newItemPresented: $viewModel.showingAddItemView)
                                }
                            }
                            
                        }
                    }
                        .font(.system(size: 50))
                        .foregroundStyle(Color.white)
                        .bold()
                }
                .padding(.bottom, 20)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 10,
               height: 400)
//        .offset(y: -100)
        Spacer()
    }
}



#Preview {
    CheckInCategoryView(userId: "5sG5SUCy39d9pjuWyls927m4Aio2", categoryId: "1", selectedItems: [])
}
