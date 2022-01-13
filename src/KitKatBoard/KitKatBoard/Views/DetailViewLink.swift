//
//  ContentView.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 06/12/2021.
//

import SwiftUI

struct DetailViewLink: View {
    var spot : Record
    var spotId : String 
    
    
    var body: some View {
    
        
        VStack {
            if let notNilData = spot{
            let difficultyText: String = "😵 Difficulty level: " +  String(notNilData.fields.difficultyLevel!) + "/5"
            let beachName: String = "🏝 Beach: " + notNilData.fields.destination!
            let country : String = "🌎 : " + notNilData.fields.destinationStateCountry
            let wave : String = "🌊 : " + notNilData.fields.surfBreak.joined(separator: ", ")
            let placeForMap: String = notNilData.fields.destination!
            
            
           
                
            MapView(addressNav: placeForMap)
                .ignoresSafeArea(edges: .top)
                .frame(height: 150)
                RemoteImage(url: notNilData.fields.photos[0].url)
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
//        .onAppear(){
//            Api().loadDataSpot(spotId: spotId) { SpotsData in
//                spot = SpotsData
//            }
//        }
    }



//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailViewLink()
//    }
//}
}
