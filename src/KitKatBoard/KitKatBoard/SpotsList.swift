//
//  SpotsList.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 06/12/2021.
//
import SwiftUI
import Foundation
struct Spot: Identifiable {
    let name: String
    let country: String
    let id = UUID()
    public var flag: String
        var icon: Image {
            Image(flag)
        }
    public var picture: String
        var image: Image {
            Image(picture)
        }
    
}
var spots = [
    Spot(name: "Banzai Beach", country:"Hawaï (USA)", flag:"HawaiFlag", picture:"KauaiHawaii"),
    Spot(name: "Ulladulla", country:"Australia", flag:"AustralianFlag", picture:"UlladullaAustralia"),
    Spot(name: "Taghazout", country:"Morocco", flag:"MoroccanFlag", picture:"TaghazoutMorocco"),

]

//var body: some View {
//
//    NavigationView {
//        List(spots) { spot in
//            VStack{
//                Text(spot.name)
//                Text(spot.country)
//        }
//        }
//        .navigationTitle("Spots")
//        .toolbar { EditButton() }
//    }
   
//}


