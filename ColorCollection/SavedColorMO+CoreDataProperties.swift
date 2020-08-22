//
//  SavedColorMO+CoreDataProperties.swift
//  ColorCollection
//
//  Created by Akatsuki on 2020/07/29.
//
//

import Foundation
import CoreData

extension SavedColorMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedColorMO> {
        return NSFetchRequest<SavedColorMO>(entityName: "SavedColorMO")
    }

    @NSManaged public var id: UUID
    @NSManaged public var hex: String
}

extension SavedColorMO : Identifiable {

}
