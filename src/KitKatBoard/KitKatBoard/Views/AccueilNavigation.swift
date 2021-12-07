//
//  AccueilNavigation.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 07/12/2021.
//

import SwiftUI

struct AccueilNavigation: View {
    var body: some View {
        NavigationView{
        List{
            ForEach (spots.records){ spot in
                NavigationLink {
                    DetailViewLink(spot:spot)
                } label: {
                    VStack{
                        HStack{
                            Text(spot.address + " - " + spot.surfBreak)
                        }
                    }
                }


                }
            }
            .navigationTitle("Best spots in Universe")
            
    }
}


struct AccueilNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AccueilNavigation()
    }
}
}
