//
//  SpotsList.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 06/12/2021.
//
import SwiftUI
import Foundation
struct SpotsData: Codable {
    let records: [Record]
}

struct Record: Codable, Identifiable {
    let id: UUID = UUID()
    
    let surfBreak,address, photos: String
 
    
    
    enum CodingKeys: String, CodingKey {
        case surfBreak = "Surf Break"
        case photos = "Photos"
        case address = "Address"
    }
    
    
    
}






