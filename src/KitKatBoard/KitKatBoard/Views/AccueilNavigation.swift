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
                        
                            Text(spot.fields.address)
                            Text(spot.fields.surfBreak[0])
                        
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
