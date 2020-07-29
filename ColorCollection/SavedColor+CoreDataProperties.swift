//
//  SavedColor+CoreDataProperties.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/29.
//
//

import Foundation
import CoreData


extension SavedColor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedColor> {
        return NSFetchRequest<SavedColor>(entityName: "SavedColor")
    }

    @NSManaged public var id: UUID
    @NSManaged public var hex: String

}

extension SavedColor : Identifiable {

}
