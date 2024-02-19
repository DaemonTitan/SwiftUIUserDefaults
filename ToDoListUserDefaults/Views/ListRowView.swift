//
//  ListRowView.swift
//  ToDoListUserDefaults
//
//  Created by Tony Chen on 9/2/2024.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
//    
//    let title: String
//    let subTitle: String
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
                .font(.title2)
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.subTitle)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(.vertical, 10)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
     static let item1 = ItemModel(title: "1st item", subTitle: "some item", isCompleted: true)
     static let item2 = ItemModel(title: "2nd item", subTitle: "some new items", isCompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
