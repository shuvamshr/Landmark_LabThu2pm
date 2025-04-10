//
//  AttractionDetailView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct AttractionDetailView: View {
    
    @EnvironmentObject private var viewModel: AttractionViewModel
    
    var attraction: Attraction
    
    @State private var name = ""
    @State private var address = ""
    @State private var image = "default"
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
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
            
            Section {
                Button("Delete Attraction", role: .destructive) {
                    deleteAttraction()
                    dismiss()
                }
            }
        }
        .navigationTitle("Attraction Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    updateAttraction()
                }
            }
        }
        .onAppear {
            populateAttraction()
        }
    }
    
    private func populateAttraction() {
        name = attraction.name
        address = attraction.address
        image = attraction.image
    }
    
    private func updateAttraction() {
        viewModel.updateAttraction(attraction: Attraction(id: attraction.id, name: name, address: address, image: image))
    }
    
    private func deleteAttraction() {
        viewModel.deleteAttraction(attraction: attraction)
    }
}

//#Preview {
//    AttractionDetailView()
//}
