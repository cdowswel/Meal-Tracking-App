//
//  DayItem+CoreDataProperties.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation
import CoreData


extension DayItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayItem> {
        return NSFetchRequest<DayItem>(entityName: "DayItem");
    }

    @NSManaged public var date: String?
    @NSManaged public var number: Int16
    @NSManaged public var foods: NSSet?

}

// MARK: Generated accessors for foods
extension DayItem {

    @objc(addFoodsObject:)
    @NSManaged func addToFoods(_ value: FoodItem)

    @objc(removeFoodsObject:)
    @NSManaged func removeFromFoods(_ value: FoodItem)

    @objc(addFoods:)
    @NSManaged public func addToFoods(_ values: NSSet)

    @objc(removeFoods:)
    @NSManaged public func removeFromFoods(_ values: NSSet)

}
