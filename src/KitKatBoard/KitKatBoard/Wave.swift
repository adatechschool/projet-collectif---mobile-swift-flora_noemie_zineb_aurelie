//
//  Flowers.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 06/12/2021.
//

import SwiftUI

struct Wave: View {
    var body: some View {
        Image("KauaiHawaii")
            .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(color: .gray, radius: 7)
            
    }
}

struct Wave_Previews: PreviewProvider {
    static var previews: some View {
        Wave()
    }
}
