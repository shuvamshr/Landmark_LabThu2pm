//
//  ContentView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = AttractionViewModel()
    
    var body: some View {
        TabView {
            AttractionView(viewModel: viewModel)
                .tabItem {
                    Label("Attractions", systemImage: "star.fill")
                }
            MapView(viewModel: viewModel)
                .tabItem {
                    Label("Map", systemImage: "mappin.slash.circle.fill")
                }
            Text("SettingsView()")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
