//
//  AccueilNavigation.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 07/12/2021.
//

import SwiftUI

struct AccueilNavigation: View {
    @State var spots : SpotsData = SpotsData(records: [])
    
    var body: some View {
        NavigationView{
          
            List{
                ForEach (spots.records){ spot in
                    NavigationLink {
                        DetailViewLink(spot:spot)
                    } label: {
                        VStack{
                            let surfBreakJoin: String = spot.fields.surfBreak.joined(separator: ", ")
                            Text(spot.fields.destinationStateCountry)
                            Text(surfBreakJoin)
                            
                            
                            
                        }
                    }
                    
                    
                }
            }
            .navigationTitle("Best spots in Universe")
            .onAppear(){
                Api().loadData{(records) in spots = records}
                
            }
           
            
            
            
        }
        
             
        }

        
    }
    
    
    struct AccueilNavigation_Previews: PreviewProvider {
        static var previews: some View {
            AccueilNavigation()
        }
    }

