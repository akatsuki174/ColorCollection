//
//  ContentView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExtractColorView()
                .tabItem {
                    VStack {
                        Image(systemName: "a")
                        Text("色の抽出")
                    }
                }.tag(1)
            ColorListView()
                .tabItem {
                    VStack {
                        Image(systemName: "a")
                        Text("色一覧")
                    }
                }.tag(2)
            OthersView()
                .tabItem {
                    VStack {
                        Image(systemName: "a")
                        Text("その他")
                    }
                }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
