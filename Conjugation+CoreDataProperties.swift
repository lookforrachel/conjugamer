//
//  Conjugation+CoreDataProperties.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/25/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import Foundation
import CoreData


extension Conjugation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Conjugation> {
        return NSFetchRequest<Conjugation>(entityName: "Conjugation")
    }

    @NSManaged public var pronoun: Int16
    @NSManaged public var tense: Int16
    @NSManaged public var verbMood: Int16
    @NSManaged public var conjugation: String?
    @NSManaged public var verb: Verb?

}
