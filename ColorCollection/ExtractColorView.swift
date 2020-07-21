//
//  ExtractColorView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/11.
//

import SwiftUI

struct ExtractColorView: View {
    
    @State var image: UIImage?
    @State private var showingPhotoPicker = false
    @State private var showingColorPicker = false
    
    var body: some View {
        VStack {
            Text("ExtractColorView")
            Button(action: {
                self.showingPhotoPicker = true
            }) {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            }.sheet(isPresented: $showingPhotoPicker, onDismiss: nil) {
                PhotoPicker(image: self.$image)
            }
            Button(action: {
                self.showingColorPicker = true
            }) {
                Image(systemName: "plus")
                    .frame(width: 24, height: 24, alignment: .center)
            }.sheet(isPresented: $showingColorPicker, onDismiss: nil) {
                // show color picker
            }
        }
        .padding([.leading, .trailing], 16)
    }
}

struct ExtractColorView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractColorView()
    }
}
