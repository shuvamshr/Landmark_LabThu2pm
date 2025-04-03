//
//  AddNewAttractionView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct AddNewAttractionView: View {
    
    @EnvironmentObject private var viewModel: AttractionViewModel
    
    @State var name = ""
    @State var address = ""
    @State var image = "default"
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter Name", text: $name)
                    TextField("Enter Address", text: $address)
                } header: {
                    Text("Attraction Details")
                }
                
                Section {
                    Picker("Select Image", selection: $image) {
                        Text("Default").tag("default")
                        Text("Opera House").tag("operahouse")
                        Text("Darling Harbour").tag("darlingharbour")
                        Text("Harbour Bridge").tag("harbourbridge")
                    }
                    .pickerStyle(.navigationLink)
                } footer: {
                    Text("Select an appropriate image")
                }
            }
            .navigationTitle("New Attraction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        addNewAttraction()
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addNewAttraction() {
        viewModel.addNewAttraction(attraction: Attraction(name: name, address: address, image: image))
    }
}

