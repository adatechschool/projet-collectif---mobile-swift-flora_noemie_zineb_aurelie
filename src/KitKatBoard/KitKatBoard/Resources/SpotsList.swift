//
//  SpotsList.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 06/12/2021.
//
import SwiftUI
import Foundation

// MARK: - SpotsData
struct SpotsData: Codable {
    let records: [Record]
}

// MARK: - Record
struct Record: Codable, Identifiable {
    let id: String?
    let fields: Fields
}

// MARK: - Fields
struct Fields: Codable {
   // var id: UUID=UUID()
    
    let surfBreak: [String]
    let difficultyLevel: Int?
    let destination: String
    let photos: [Photo]
    let destinationStateCountry : String
//    let address: String

    enum CodingKeys: String, CodingKey {
        case surfBreak = "Surf Break"
        case difficultyLevel = "Difficulty Level"
        case destination = "Destination"
        case photos = "Photos"
        case destinationStateCountry = "Destination State/Country"
//        case address = "Address"
    }
}

// MARK: - Photo
struct Photo: Codable {
    //var id: String?
    let url: String
//    let thumbnails: Thumbnails
}

////// MARK: - Thumbnails
//struct Thumbnails: Codable {
//    let small, large, full: Resolution
//}
//
//// MARK: - Full
//struct Resolution: Codable {
//    let url: String
//    let width, height: Int
//}









