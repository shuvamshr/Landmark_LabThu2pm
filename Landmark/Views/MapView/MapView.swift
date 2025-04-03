//
//  MapView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 3/4/2025.
//

import SwiftUI

struct MapView: View {
    
    @ObservedObject var viewModel: AttractionViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.attractions) { attraction in
                Text(attraction.name)
            }
            .navigationTitle("Map")
        }
    }
}
