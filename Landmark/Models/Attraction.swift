//
//  Attraction.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 27/3/2025.
//

import SwiftUI

struct Attraction: Identifiable {
    var id: UUID = UUID()
    var name: String
    var address: String
    var image: String = "default"
}
