//
//  ContentView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct ContentView: View {
    
    private var viewModel = AttractionViewModel()
    
    var body: some View {
        TabView {
            AttractionView()
                .tabItem {
                    Label("Attractions", systemImage: "star.fill")
                }
            MapView()
                .tabItem {
                    Label("Map", systemImage: "mappin.slash.circle.fill")
                }
            Text("SettingsView()")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
