//
//  Weather.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 1/5/2025.
//

import SwiftUI

struct WeatherResponse: Codable {
    let main: Main
}

struct Main: Codable {
    let temp: Double
}
