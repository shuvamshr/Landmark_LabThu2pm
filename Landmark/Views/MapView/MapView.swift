//
//  MapView.swift
//  Landmark
//
//  Created by Shuvam Shrestha on 3/4/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject private var viewModel: AttractionViewModel
    
    @State private var temp = 0.0
    
    var body: some View {
        NavigationStack {
            Map {
                ForEach(viewModel.attractions) { attraction in
                    
                    Annotation("Hi", coordinate: CLLocationCoordinate2D(latitude: attraction.latitude, longitude: attraction.longitude)) {
                        Circle()
                            .frame(width: 40)
                            .onTapGesture {
                                Task {
                                    await getWeather(lat: attraction.latitude, lon: attraction.longitude)
                                }
                            }
                    }
                }
                
            }
                .navigationTitle("Temperature: \(temp)")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func getWeather(lat: Double, lon: Double) async {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=9f3fa86507527f4be46c0d5ffdb71490") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                print("Temp: \(weather.main.temp)")
                DispatchQueue.main.async {
                    temp = weather.main.temp
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }
        task.resume()
    }
}
