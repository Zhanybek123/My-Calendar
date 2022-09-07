//
//  DaysOfTheWeek.swift
//  SwiftUI-Weather
//
//  Created by zhanybek salgarin on 7/5/22.
//

import SwiftUI

struct Day: Identifiable {
    let id = UUID()
    let dayOfWeek: String
    let imageName: String
    let temperature: Int
}

struct DaysOfTheWeek {
    static let days = [
        Day(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74),
        Day(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88),
        Day(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55),
        Day(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60),
        Day(dayOfWeek: "SAT", imageName: "snow", temperature: 25)
    ]
}
