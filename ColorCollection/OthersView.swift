//
//  OthersView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/11.
//

import SwiftUI

struct OthersView: View {
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        NavigationLink(destination: FAQView()) {
                            Text("FAQ")
                        }
                        Text("感想送信")
                    }
                    Text("バージョン")
                        .font(.caption)
                }
            }
        }
    }
}

struct OthersView_Previews: PreviewProvider {
    static var previews: some View {
        OthersView()
    }
}
