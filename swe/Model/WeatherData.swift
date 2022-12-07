//
//  File.swift
//  swe
//
//  Created by HA on 2022/11/13.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}

struct Main: Codable {
    let temp: Double
    
}

struct Weather: Codable {
    let description : String
    let id: Int
}
