//
//  FoodItem+CoreDataProperties.swift
//  healthproject
//
//  Created by Charles Dowswell on 4/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation
import CoreData


extension FoodItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodItem> {
        return NSFetchRequest<FoodItem>(entityName: "FoodItem");
    }

    @NSManaged public var calories: Double
    @NSManaged public var carbs: Double
    @NSManaged public var fat: Double
    @NSManaged public var name: String?
    @NSManaged public var picture: Data?
    @NSManaged public var day: NSSet?

}

// MARK: Generated accessors for day
extension FoodItem {

    @objc(addDayObject:)
    @NSManaged public func addToDay(_ value: DayItem)

    @objc(removeDayObject:)
    @NSManaged public func removeFromDay(_ value: DayItem)

    @objc(addDay:)
    @NSManaged public func addToDay(_ values: NSSet)

    @objc(removeDay:)
    @NSManaged public func removeFromDay(_ values: NSSet)

}
