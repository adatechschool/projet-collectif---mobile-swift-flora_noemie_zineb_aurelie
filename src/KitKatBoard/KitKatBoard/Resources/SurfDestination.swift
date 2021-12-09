//
//  SurfDestination.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 08/12/2021.
//

import Foundation

class Api : ObservableObject{
    //@Published var record : SpotsData = SpotsData(records:[])
    
    func loadData(completion:@escaping (SpotsData) -> ()) {
        guard let url = URL(string: "https://api.airtable.com/v0/appxT9ln6ixuCb3o1/Surf%20Destinations?api_key=key0U8yesePbr9fAH") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let records = try! JSONDecoder().decode(SpotsData.self, from: data!)
            print(records)
            DispatchQueue.main.async {
                completion(records)
            }
        }.resume()
        
    }
}
