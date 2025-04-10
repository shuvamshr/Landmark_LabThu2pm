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
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            viewModel.addVisit()
                        } label: {
                            Label("Add Visit", systemImage: "plus.square")
                        }
                        .tint(Color.accentColor)
                    }
                    
                }
            }
            .navigationTitle("Attractions")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "mappin.circle")
                        Text("\(viewModel.visitCount) Visits")
                    }
                    .bold()
                    .foregroundStyle(Color.accentColor)
                }
                
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

