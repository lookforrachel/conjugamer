//
//  VerbDatabase+CoreDataProperties.swift
//  CoreDataPreloadDemo
//
//  Created by Rachel Yee on 8/10/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation
import CoreData


extension VerbDatabase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VerbDatabase> {
        return NSFetchRequest<VerbDatabase>(entityName: "VerbDatabase")
    }

    @NSManaged public var ger: String?
    @NSManaged public var id: String?
    @NSManaged public var impNous: String?
    @NSManaged public var impTu: String?
    @NSManaged public var impVous: String?
    @NSManaged public var indConIl: String?
    @NSManaged public var indConIls: String?
    @NSManaged public var indConJe: String?
    @NSManaged public var indConNous: String?
    @NSManaged public var indConTu: String?
    @NSManaged public var indConVous: String?
    @NSManaged public var indFSIl: String?
    @NSManaged public var indFSIls: String?
    @NSManaged public var indFSJe: String?
    @NSManaged public var indFSNous: String?
    @NSManaged public var indFSTu: String?
    @NSManaged public var indFSVous: String?
    @NSManaged public var indImpIl: String?
    @NSManaged public var indImpIls: String?
    @NSManaged public var indImpJe: String?
    @NSManaged public var indImpNous: String?
    @NSManaged public var indImpTu: String?
    @NSManaged public var indImpVous: String?
    @NSManaged public var indPreIl: String?
    @NSManaged public var indPreIls: String?
    @NSManaged public var indPreJe: String?
    @NSManaged public var indPreNous: String?
    @NSManaged public var indPreTu: String?
    @NSManaged public var indPreVous: String?
    @NSManaged public var indPSIl: String?
    @NSManaged public var indPSIls: String?
    @NSManaged public var indPSJe: String?
    @NSManaged public var indPSNous: String?
    @NSManaged public var indPSTu: String?
    @NSManaged public var indPSVous: String?
    @NSManaged public var inf: String?
    @NSManaged public var pastPart: String?
    @NSManaged public var prePart: String?
    @NSManaged public var subImpIl: String?
    @NSManaged public var subImpIls: String?
    @NSManaged public var subImpJe: String?
    @NSManaged public var subImpNous: String?
    @NSManaged public var subImpTu: String?
    @NSManaged public var subImpVous: String?
    @NSManaged public var subPreIl: String?
    @NSManaged public var subPreIls: String?
    @NSManaged public var subPreJe: String?
    @NSManaged public var subPreNous: String?
    @NSManaged public var subPreTu: String?
    @NSManaged public var subPreVous: String?
    @NSManaged public var aux: String?
    @NSManaged public var indPCJe: String?
    @NSManaged public var indPCTu: String?
    @NSManaged public var indPCIl: String?
    @NSManaged public var indPCNous: String?
    @NSManaged public var indPCVous: String?
    @NSManaged public var indPCIls: String?
}
