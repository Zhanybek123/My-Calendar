//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by zhanybek salgarin on 6/30/22.
//

import SwiftUI

struct WeatherButton: View {
    
    let tittle: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Text(tittle)
            .frame(width: 250, height: 50, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
    
    
}
