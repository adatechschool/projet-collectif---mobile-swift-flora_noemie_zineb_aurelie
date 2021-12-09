//
//  MoreInfos.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 09/12/2021.
//

import SwiftUI
import MapKit
import CoreLocation

func getCoordinate( addressString : String,
        completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(addressString) { (placemarks, error) in
        if error == nil {
            if let placemark = placemarks?[0] {
                let location = placemark.location!
                    
                completionHandler(location.coordinate, nil)
                return
            }
        }
            
        completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
    }
}
struct MapView: View {
    @State var region : MKCoordinateRegion = MKCoordinateRegion()
    var addressNav : String
    
    var body: some View {
        Map(coordinateRegion:$region)
            .onAppear(){
                getCoordinate(addressString:addressNav, completionHandler:{(coordinates, error) in
                    region = MKCoordinateRegion(
                        center: coordinates,
                             span: MKCoordinateSpan(latitudeDelta: 0.6, longitudeDelta: 0.6)
                    )
                    
                }
                )
            }
}
}
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(spot:Record)
//    }
//}
