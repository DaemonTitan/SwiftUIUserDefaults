//
//  ListView.swift
//  ToDoListUserDefaults
//
//  Created by Tony Chen on 9/2/2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                ListContent()
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("To Do List")
        .toolbar {
            ToolbarItem(placement:.topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add")
                }
            }
        }
    }
}

struct ListContent: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.spring) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}
