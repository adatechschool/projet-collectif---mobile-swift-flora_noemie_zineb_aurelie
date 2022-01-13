//
//  FormSpot.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 13/12/2021.
//

import SwiftUI

struct FormSpot: View {
//    var newSpot = SpotsData(records: [])
    @State var beach: String = ""
    @State var sbreak: String = ""
    @State var country: String = ""
    @State private var isExpended = false
    @State private var selectedNum = "Choose difficulty Level"
    var choice = ["1","2","3","4","5"]
    @State private var showingAlert = false
    @State private var showingImagePicker = false
  
    
    var body: some View {
        NavigationView{
            
        Form {
            VStack(alignment: .center, spacing:3){
            Text("Pick your image")
                    .foregroundColor(Color(red: 0.831, green: 0.831, blue: 0.84))
                    .font(.title3)
//                    .multilineTextAlignment(.leading)
                    .padding(.leading, -160)
                    Spacer()
            PictureView()
            }
            .padding(.leading, 65.0)
            
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
            let newPhoto = "https://dl.airtable.com/YzqA020RRLaTyAZAta9g_brandon-compagne-308937-unsplash.jpg"
            let newSpot = SpotsPostData(surfbreak: sbreak, difficultylevel: selectedNum, destination: beach, urlphoto: newPhoto, destinationstatecountry: country)
            Button(action: {
                showingAlert = true
            }){
                HStack {
                    Spacer()
                    Text("Save")
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(10)
                .background(Color.accentColor)
                .cornerRadius(8)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Form submitted"),
                    dismissButton: .default(Text("OK")))
                }
            }
            .onTapGesture {
                Api().postData(newSpot: newSpot)
            }
                .padding()
               
                

                //print(newSpot)
            
                
                

            
        }
        .navigationBarTitle("Infos du spot")
        }
    }
}
        

//struct FormSpot_Previews: PreviewProvider {
//    static var previews: some View {
//        FormSpot()
//    }
//}
