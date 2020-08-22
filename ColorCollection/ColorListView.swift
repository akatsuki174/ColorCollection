//
//  ColorListView.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/11.
//

import SwiftUI

struct ColorListView: View {
    var numberArray = ["1","2","3","4","5","6", "7"]
    
    @FetchRequest(
        entity: SavedColorMO.entity(),
        sortDescriptors: []
    ) var savedColors: FetchedResults<SavedColorMO>
    
    var body: some View {
        List(0 ..< savedColors.count) { i in
            HStack {
                VStack(alignment: .leading) {
                    Text("\(savedColors[i].id)")
                    Text("\(savedColors[i].hex)")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Color(red: 64/255, green: 64/255, blue: 64/255)
                }
                .frame(width: 50, height: 50, alignment: .trailing)
            }
        }
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorListView()
    }
}
