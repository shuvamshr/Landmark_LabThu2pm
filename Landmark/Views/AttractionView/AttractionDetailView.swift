//
//  AttractionDetailView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct AttractionDetailView: View {
    
    var attraction: Attraction
    
    var body: some View {
        ScrollView {
            VStack {
                Image(attraction.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                Text(attraction.name)
                    .font(.largeTitle)
                    .bold()
                Text(attraction.address)
                Spacer()
            }
        }
    }
}

//#Preview {
//    AttractionDetailView()
//}
