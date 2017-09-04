//
//  Conjugation+CoreDataClass.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/25/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import Foundation
import CoreData

@objc(Conjugation)
public class Conjugation: NSManagedObject {

    func getConjugations(request:NSFetchRequest<Conjugation>, moc: NSManagedObjectContext) -> [Conjugation] {
        do {
            let conjugations = try moc.fetch(request)
            return conjugations
        }
        catch{
            fatalError("Error in getting list of conjugations")
        }
    
    }
}
