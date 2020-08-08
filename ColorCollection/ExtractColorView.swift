//
//  ExtractColorView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/11.
//

import SwiftUI

struct ExtractColorView: View {
    
    @State var image: UIImage?
    @State var color = Color.gray
    @State private var showingPhotoPicker = false
    
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            Text("ExtractColorView")
            Button(action: {
                self.showingPhotoPicker = true
            }) {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 200)
                    .scaledToFit()
            }.sheet(isPresented: $showingPhotoPicker, onDismiss: nil) {
                PhotoPicker(image: self.$image)
            }
            ColorPicker("Pick a color", selection: $color)
                .frame(width: 150, height: 50)
            Button(action: {
                saveColor()
            }, label: {
                Text("色を保存")
                    .foregroundColor(color)
            })
            Spacer()
        }
        .padding([.leading, .trailing], 16)
    }
    
    private func saveColor() {
        let uiColor = color.uiColor()
        let newColor = SavedColorMO(context: context)
        newColor.id = UUID()
        newColor.hex = uiColor.toHexString()
        PersistenceManager.shared.save()
    }
}

struct ExtractColorView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractColorView()
    }
}
