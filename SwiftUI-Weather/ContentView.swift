//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by zhanybek salgarin on 6/30/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var days: [Day] = DaysOfTheWeek.days
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(CityName: "Cupertino, CA")
                
                VStack(spacing: 0) {
                    MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :  "cloud.sun.fill", temperature: 76)
                }
                .padding(.bottom, 40)
                
                GeometryReader { geometry in
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(days,id: \.id) { item in
                                WeatherDayView(days: item)
                            }
                        }
                        .frame(width: geometry.size.width, height: 250)
                    }
                }
                
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(tittle: isNight ? "Change Night To Day" : "Change Day To Night", textColor: isNight ? .white : .blue, backgroundColor: isNight ? .red : .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct WeatherDayView: View {
    
    var days: Day
    
    var body: some View {
        VStack {
            Text(days.dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: days.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
                
            
            Text("\(days.temperature)°")
                .font(.system(size: 25, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var CityName: String
    
    var body: some View {
        Text(CityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180, alignment: .center)
        
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}


