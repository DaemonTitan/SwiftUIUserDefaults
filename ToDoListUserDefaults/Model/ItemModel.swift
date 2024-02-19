//
//  ItemModel.swift
//  ToDoListUserDefaults
//
//  Created by Tony Chen on 9/2/2024.
//

import Foundation

// Immutable Struct
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let subTitle: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, subTitle: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, subTitle: subTitle, isCompleted: !isCompleted)
    }
}
