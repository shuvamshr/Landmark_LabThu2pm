//
//  AttractionView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct AttractionView: View {
    
    @EnvironmentObject private var viewModel: AttractionViewModel
    
    @State private var isNewAttractionSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.attractions) { attraction in
                    NavigationLink {
                        AttractionDetailView(attraction: attraction)
                    } label: {
                        AttractionListItem(attraction: attraction)
                    }
                }
            }
            .navigationTitle("Attractions")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isNewAttractionSheetShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isNewAttractionSheetShowing) {
                AddNewAttractionView()
            }
        }
    }
}

