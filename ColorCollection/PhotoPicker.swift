//
//  PhotoPicker.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/21.
//

import SwiftUI
import PhotosUI

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
                itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { [weak self] selectedImage, error in
                    DispatchQueue.main.async {
                        guard let self = self else { return }
                        if let selectedImage = selectedImage as? UIImage {
                            self.image = selectedImage
                        } else {
                            
                       }
                    }
                })
            }
        }
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PhotoPicker>) {
    }

    func makeCoordinator() -> PhotoPicker.Coordinator {
        let coordinator = Coordinator(image: $image)
        return coordinator
    }
    
}
