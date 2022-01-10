//
//  Tabbar.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 13/12/2021.
//

import SwiftUI

struct Tabbar: View {
    
    
    var body: some View {
        
        TabView {
            WaveImage()
                .tabItem{
                    Image(systemName: "house")
                    Text("HOME")
                    
                }
            AccueilNavigation()
             .tabItem {
                Image(systemName: "sun.max")
                Text("SPOTS")
                 
        
              }
            FormSpot()
             .tabItem {
                Image(systemName: "plus")
                Text("EDIT SPOT")
                 
        
              }
        }
}
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}


