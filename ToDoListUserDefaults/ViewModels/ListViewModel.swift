//
//  ListViewModel.swift
//  ToDoListUserDefaults
//
//  Created by Tony Chen on 10/2/2024.
//

import Foundation

// CRUD Functions
class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        //getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is title", subTitle: "This is subTitile", isCompleted: true),
            ItemModel(title: "Title", subTitle: "Sub title", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, subTitle: String) {
        let newItem = ItemModel(title: title, subTitle: subTitle, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
        
    }
    
}
