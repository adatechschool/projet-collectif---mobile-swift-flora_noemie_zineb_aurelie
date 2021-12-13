//
//  FormSpot.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 13/12/2021.
//

import SwiftUI

struct FormSpot: View {
    @State var beach: String = ""
    @State var sbreak: String = ""
    @State var country: String = ""
    @State var diffLevel: String = ""
    @State private var isExpended = false
    @State private var selectedNum = "Choose difficulty Level"
    var choice = ["1","2","3","4","5"]
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
        Form {
            TextField("Beach Name", text: $beach)
            
            TextField("Surf Break", text: $sbreak)
                    
            TextField("State / Country", text: $country)
            
            VStack(alignment: .center, spacing:3){
                DisclosureGroup("\(selectedNum)", isExpanded: $isExpended){
                    
                    VStack{
                        ForEach(choice, id:\.self) {
                            num in
                            
                            Spacer()
                            Text("\(num)")
                                .font(.title3)
                                .padding(.horizontal)
                                .onTapGesture {
                                    self.selectedNum = num
                                    withAnimation{
                                        self.isExpended.toggle()
                                    }
                                }
                        }
                    }
                }
                .accentColor(.gray)
                .font(.headline)
                .foregroundColor(Color.black)
                .padding(.top, 7.0)
                .cornerRadius(8)
                Spacer()
            }
            
            Button(action: {showingAlert = true}){
                HStack {
                    Spacer()
                    Text("Save")
                    Spacer()
                }
            }
            .foregroundColor(.white)
                .padding(10)
                .background(Color.accentColor)
                .cornerRadius(8)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Form submitted"),
                    dismissButton: .default(Text("OK")))
                    }
                .padding()
        }
        .navigationBarTitle("Infos du spot")
        }
    }
}
        

struct FormSpot_Previews: PreviewProvider {
    static var previews: some View {
        FormSpot()
    }
}
