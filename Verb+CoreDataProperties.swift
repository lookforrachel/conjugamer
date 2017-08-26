//
//  Verb+CoreDataProperties.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/25/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import Foundation
import CoreData


extension Verb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Verb> {
        return NSFetchRequest<Verb>(entityName: "Verb")
    }

    @NSManaged public var auxiliary: Int16
    @NSManaged public var verbGroup: Int16
    @NSManaged public var infinitive: String?
    @NSManaged public var isRegular: Bool
    @NSManaged public var conjugation: NSSet?

}

// MARK: Generated accessors for conjugation
extension Verb {

    @objc(addConjugationObject:)
    @NSManaged public func addToConjugation(_ value: Conjugation)

    @objc(removeConjugationObject:)
    @NSManaged public func removeFromConjugation(_ value: Conjugation)

    @objc(addConjugation:)
    @NSManaged public func addToConjugation(_ values: NSSet)

    @objc(removeConjugation:)
    @NSManaged public func removeFromConjugation(_ values: NSSet)

}
