//
//  SurfDestination.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 08/12/2021.
//

import Foundation

class Api : ObservableObject{
    @Published var record : SpotsData = SpotsData(records:[])
    @Published var recordSpot : OneSpotData = OneSpotData(records:[])
    
    func loadData(completion:@escaping (SpotsData) -> ()) {
        guard let url = URL(string: "http://localhost:8080/spots") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(data)
            if let secureData = data{
            if let records = try? JSONDecoder().decode(SpotsData.self, from: secureData){
                print(records)
                DispatchQueue.main.async {
                    completion(records)
                }
            }
            }
            else{print(error)}
        }.resume()
      
    }

    func postData(newSpot: SpotsData){
        let jsonData = try! JSONEncoder().encode(newSpot)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        guard let url = URL(string: "http://localhost:8080/spots") else {
            print("Invalid url...")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-Type")


        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("SUCCESS:\(response)")
            }
            catch {
                print(error)
            }
        }
        task.resume()

    }


    
    func loadDataSpot(spotId: String, completion:@escaping (Records) -> ()) {
        var trueURl = "http://localhost:8080/spots/" + spotId
    guard let url = URL(string: trueURl) else {
        print("Invalid url...")
        return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
        print(data)
        if let secureData = data{
        if let records = try? JSONDecoder().decode(Records.self, from: secureData){
            print(records)
            DispatchQueue.main.async {
                completion(records)
            }
        }
        }
        else{print(error)}
    }.resume()
  


func postDataSpot(newSpot: OneSpotData){
    let jsonData = try! JSONEncoder().encode(newSpot)
    let jsonString = String(data: jsonData, encoding: .utf8)!
    guard let url = URL(string: "http://localhost:8080/spots{{id}}") else {
        print("Invalid url...")
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "content-Type")


    request.httpBody = jsonData
    let task = URLSession.shared.dataTask(with: request) {data, _, error in
        guard let data = data, error == nil else {
            return
        }
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCCESS:\(response)")
        }
        catch {
            print(error)
        }
    }
    task.resume()

}
}
}

