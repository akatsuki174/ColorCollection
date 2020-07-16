//
//  ExtractColorView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/11.
//

import SwiftUI
import PhotosUI

struct ExtractColorView: View {
    
    @State var image: UIImage?
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
                PhotoPicker(image: self.$image)
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

struct PhotoPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = PHPickerViewController
    
    @Binding var image: UIImage?
    final class Coordinator: NSObject, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
        
        @Binding var image: UIImage?
        
        init(image: Binding<UIImage?>) {
            _image = image
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            let itemProvider = results.first?.itemProvider
            
            if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { [weak self] image, error in
                    if let image = image as? UIImage {
                        self?.image = image
                    }
                })
            }
        }
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PhotoPicker>) {
    }

    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator(image: $image)
        return coordinator
    }
    
}
