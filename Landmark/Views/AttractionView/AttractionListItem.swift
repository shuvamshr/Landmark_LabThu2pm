//
//  AttractionListItem.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct AttractionListItem: View {
    
    var attraction: Attraction
    
    var body: some View {
        HStack(spacing: 16) {
            Image(attraction.image)
                .resizable()
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(attraction.name)
                    .font(.headline)
                Text(attraction.address)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
//    Circle()
//        .frame(width: 200, height: 200)
    
    Image("default")
        .resizable()
        .scaledToFill()
        .frame(width: 45, height: 45)
        .clipShape(Circle())
    
}
