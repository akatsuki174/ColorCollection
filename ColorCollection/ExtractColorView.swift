//
//  ExtractColorView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/11.
//

import SwiftUI

struct ExtractColorView: View {
    var body: some View {
        VStack {
            Text("ExtractColorView")
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .padding([.leading, .trailing], 16)
        }
    }
}

struct ExtractColorView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractColorView()
    }
}
