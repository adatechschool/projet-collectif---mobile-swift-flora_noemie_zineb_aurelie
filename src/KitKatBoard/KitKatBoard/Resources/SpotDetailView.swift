//
//  SpotDetailView.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 06/01/2022.
//

import Foundation
import SwiftUI

struct OneSpotData: Codable {
    let records: [Records]
}

// MARK: - Record
struct Records: Codable {
    let id: String
    let fields: Field
}

// MARK: - Fields
struct Field: Codable {
    let surfBreak: [String]
    let difficultyLevel: Int
    let destination: String
    let photos: [Photo]
    let destinationStateCountry: String

    enum CodingKeys: String, CodingKey {
        case surfBreak = "Surf Break"
        case difficultyLevel = "Difficulty Level"
        case destination = "Destination"
        case photos = "Photos"
        case destinationStateCountry = "Destination State/Country"
    }
}

// MARK: - Photo
struct Photo: Codable {
    let url: String
}

