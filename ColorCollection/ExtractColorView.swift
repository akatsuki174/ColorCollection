//
//  ExtractColorView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/11.
//

import SwiftUI
import PhotosUI

struct ExtractColorView: View {
    
    @State private var showingPhotoPicker = false
    
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
