//
//  PictureView.swift
//  KitKatBoard
//
//  Created by Zineb Abdellaoui on 14/12/2021.


import SwiftUI


struct PictureView: View {
    //@State private var image:Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State var image: Image? = nil

    var body: some View {
        VStack(alignment: .center, spacing:3){
                if (image == nil) {
                Image(systemName: "photo")
                        .resizable()
                        .frame(width:150, height:150)
                }
                else {
                    image?
                        .resizable()
                        .frame(width:150, height:150)
                        .scaledToFit()
                }
            }
            .onTapGesture {
                showingImagePicker=true

                //Button("Save", action:save)
            }
            .padding([.horizontal,.bottom])
            .onChange(of: inputImage){
                _ in loadImage()
            }
            .sheet(isPresented:$showingImagePicker){
                        ImagePicker(image: $inputImage)
                    }

    }
    func loadImage(){
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)

    }
    func save(){

    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView()
    }
}
