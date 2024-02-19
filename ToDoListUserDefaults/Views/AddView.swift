//
//  AddView.swift
//  ToDoListUserDefaults
//
//  Created by Tony Chen on 9/2/2024.
//

import SwiftUI

struct AddView: View {
    
    @State var titleField: String = ""
    @State var subTitleField: String = ""
    
    var body: some View {
        ZStack {
            Form {
                // Title Section
                Section {
                    ToDoDetailSection(titleField: $titleField, subTitleField: $subTitleField)
                } header: {
                    Text("To do details")
                }
                
                // Details section
                Section {
                    AdditionalInformationSection()
                } header: {
                    Text("Additional information")
                }
            }
        }
        .safeAreaInset(edge: VerticalEdge.bottom, content: {
            SaveButton(titleField: $titleField, 
                       subTitleField: $subTitleField)
        })
        .navigationTitle("Add To Do")
    }
}

struct ToDoDetailSection: View {
    @Binding var titleField: String
    @Binding var subTitleField: String
    
    var body: some View {
        VStack {
            TextField("Please enter title...", text: $titleField)
            Divider()
            TextField("Please enter details...", text: $subTitleField)
        }
    }
}

struct AdditionalInformationSection: View {
    @State var toDoDetail: String = ""
    
    var body: some View {
        ZStack(alignment: .leading, content: {
            if toDoDetail.isEmpty {
                VStack {
                    Text("Plase enter additional information")
                        .padding(.top, 15)
                        .padding(.leading, 5)
                    .foregroundStyle(Color(.systemGray3))
                    Spacer()
                }
            }
            TextEditor(text: $toDoDetail)
                .font(.subheadline)
                .frame(height: 100)
        })
    }
}

struct SaveButton: View {
    @EnvironmentObject var listViewModel: ListViewModel

    @Binding var titleField: String
    @Binding var subTitleField: String
    
    @Environment(\.dismiss) var dismiss
   
    var body: some View {
        Button(action: saveButtonPressed, label: {
            HStack {
                Image(systemName: "square.and.arrow.down")
                    .font(.system(size: 20))
                    .padding(.bottom, 5)
                Text("Save")
                    .font(.headline)
                    .frame(height: 50)
                    .padding(.horizontal, 12)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
        })
        .disabled(disableButton())
        .padding(20)
    }
    
    func saveButtonPressed() {
        if titleField.count > 3 {
            listViewModel.addItem(title: titleField,
                                  subTitle: subTitleField)
            dismiss()
        }
    }
    
    func disableButton() -> Bool {
        if titleField.count > 3 {
            return false
        } else {
            return true
        }
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
