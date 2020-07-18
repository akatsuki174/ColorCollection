//
//  ColorListView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/11.
//

import SwiftUI

struct ColorListView: View {
    var numberArray = ["1","2","3","4","5","6", "7"]
    var body: some View {
        List(0..<numberArray.count) {i in
            Text("\(numberArray[i])")
        }
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorListView()
    }
}
