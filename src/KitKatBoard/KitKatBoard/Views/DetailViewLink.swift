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
            let placeForMap: String = spot.fields.address
            
            RemoteImage(url: self.spot.fields.photos[0].thumbnails.full.url)
                
            MapView(addressNav: placeForMap)
            Text(beachName)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(hue: 0.594, saturation: 0.517, brightness: 0.884))
            Text(country)
            Text(wave)
            Text(difficultyText)
        }
       
    }



//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailViewLink()
//    }
//}
}
