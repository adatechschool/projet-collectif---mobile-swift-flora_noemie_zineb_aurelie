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
             
            RemoteImage(url: self.spot.fields.photos[0].thumbnails.full.url)
                
            Text(spot.fields.address)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(hue: 0.594, saturation: 0.517, brightness: 0.884))
               
            Text(spot.fields.surfBreak.joined(separator: ", "))
            Text(spot.fields.)
        }
       
    }



//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailViewLink()
//    }
//}
}
