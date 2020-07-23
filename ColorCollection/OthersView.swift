//
//  OthersView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/11.
//

import SwiftUI

struct OthersView: View {
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Q&A")
                    Text("感想送信")
                }
                Text("バージョン")
                    .font(.caption)
            }
        }
    }
}

struct OthersView_Previews: PreviewProvider {
    static var previews: some View {
        OthersView()
    }
}
