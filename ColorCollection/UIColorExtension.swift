//
//  UIColorExtension.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/28.
//

import SwiftUI

extension UIColor {
    func toHexString() -> String {
        if let components = self.cgColor.components {
            let r:CGFloat = components[0]
            let g:CGFloat = components[1]
            let b:CGFloat = components[2]
            
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            
            return String(format:"#%06x", rgb)
        } else {
            return ""
        }
    }
}
