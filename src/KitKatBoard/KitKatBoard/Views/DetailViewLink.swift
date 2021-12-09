//
//  ContentView.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 06/12/2021.
//

import SwiftUI

struct DetailViewLink: View {
    var spot : Record
    
    
    var body: some View {
    
        
        VStack {
            let difficultyText: String = "😵 Difficulty level: " +  String(spot.fields.difficultyLevel) + "/5"
            let beachName: String = "🏝 Beach: " + spot.fields.destination
            let country : String = "🌎 : " + spot.fields.destinationStateCountry
            let wave : String = "🌊 : " + spot.fields.surfBreak.joined(separator: ", ")
            let placeForMap: String = spot.fields.destinationStateCountry
            
           
                
            MapView(addressNav: placeForMap)
                .ignoresSafeArea(edges: .top)
                .frame(height: 150)
            RemoteImage(url: self.spot.fields.photos[0].thumbnails.full.url)
                .offset(y: -50)
                .padding(.bottom, -70)
                .frame(height: 70)
            
            VStack{
                Spacer()
            Text(beachName)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(hue: 0.594, saturation: 0.517, brightness: 0.884))
                Spacer()
            Text(country)
                Spacer()
            Text(wave)
                Spacer()
            Text(difficultyText)
            Spacer()
            
        }
        .padding()
        Spacer()
        }
    }



//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailViewLink()
//    }
//}
}
