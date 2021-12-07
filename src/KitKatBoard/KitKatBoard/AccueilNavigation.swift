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
            ForEach (spots){ spot in
                NavigationLink {
                    DetailViewLink(spot:spot)
                } label: {
                    VStack{
                        HStack{
                            Image(spot.flag)
                                .resizable()
                                .frame(width: 25, height: 20)
                            Text(spot.name + " - " + spot.country)
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
