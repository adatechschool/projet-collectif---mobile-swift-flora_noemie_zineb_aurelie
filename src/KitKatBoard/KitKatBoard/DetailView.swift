//
//  ContentView.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 06/12/2021.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            Wave()
            Text("Banzai Beach")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(hue: 0.594, saturation: 0.517, brightness: 0.884))
               
            HStack{
                Image("HawaiFlag")
                .renderingMode(.none)
                .resizable()
                .frame(width: 50, height: 30)
            
            
        
                Text("Hawaï (USA)")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 1.0, saturation: 0.068, brightness: 0.516))
            }
        }
       
    }



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
}
