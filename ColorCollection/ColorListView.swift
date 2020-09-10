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
        List {
            ForEach(savedColors, id: \.self) { color in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(color.id)")
                        Text("\(color.hex)")
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Color(hex: color.hex)
                            .border(Color(UIColor.label), width: 1)
                    }
                    .frame(width: 50, height: 50, alignment: .trailing)
                }
            }
            .onDelete(perform: deleteColor(offsets:))
        }
    }
    
    func deleteColor(offsets: IndexSet) {
        PersistenceManager.shared.delete(color: savedColors[offsets.first ?? 0])
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorListView()
    }
}
