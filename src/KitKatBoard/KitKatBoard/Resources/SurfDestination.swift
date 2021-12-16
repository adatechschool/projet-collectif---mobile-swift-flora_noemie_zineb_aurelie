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
            if let secureData = data{
            if let records = try? JSONDecoder().decode(SpotsData.self, from: secureData){
                print(records)
                DispatchQueue.main.async {
                    completion(records)
                }
            }
            }}.resume()
      
    }

//    func postData(newSpot: SpotsData){
//        let jsonData = try! JSONEncoder().encode(newSpot)
//        let jsonString = String(data: jsonData, encoding: .utf8)!
//        guard let url = URL(string: "https://api.airtable.com/v0/appxT9ln6ixuCb3o1/Surf%20Destinations?api_key=key0U8yesePbr9fAH") else {
//            print("Invalid url...")
//            return
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "content-Type")

//        let jsonString : [String : AnyHashable] = [
//            "userId" : 1150,
//            "title" : "SURF",
//            "body" : "je suis ton body"
//
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: jsonString, options: .fragmentsAllowed)
//        let task = URLSession.shared.dataTask(with: request) {data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print("SUCCESS:\(response)")
//            }
//            catch {
//                print(error)
//            }
//        }
//        task.resume()
//
//    }
}
