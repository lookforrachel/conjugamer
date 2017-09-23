//
//  GamePlayPredicates.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 9/19/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import Foundation
import CoreData


class GamePlayPredicates {
    
    //Verb Mood
    var predicateListTense = [NSPredicate]()

    let predicateMoodGer = NSPredicate(format: "verbMood == 0")
    let predicatePart = NSPredicate(format: "verbMood == 1")
    let predicateInd = NSPredicate(format: "verbMood == 2")
    let predicateCon = NSPredicate(format: "verbMood == 3")
    let predicateSub = NSPredicate(format: "verbMood == 4")
    let predicateImp = NSPredicate(format: "verbMood == 5")
    
    //Tense
    let predicatePre = NSPredicate(format: "tense == 0")
    let predicateImpa = NSPredicate(format: "tense == 1")
    let predicatePS = NSPredicate(format: "tense == 2")
    let predicateFS = NSPredicate(format: "tense == 3")


    init() {
        combineMoodTense()
        setupFetchRequest()
        
        //let predicates = GamePlayPredicate()
    }


    
    func combineMoodTense() {

    let predicateIndPre = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates:[predicateInd,predicatePre])
    let predicateIndImpa = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates:[predicateInd,predicateImpa])
    }


    func setupFetchRequest(){
        
        //Tenses
        let isIndPreOn = UserDefaults.standard.bool(forKey: "isIndPreOn")
        let isIndImpOn = UserDefaults.standard.bool(forKey: "isIndImpOn")
        
        // Tenses
        if isIndPreOn {
            predicateListTense.append(predicateIndPre)
        }
        if isIndImpOn {
            predicateListTense.append(predicateIndImpa)
        }
        
        // Request
        
        let verbRequest:NSFetchRequest<Conjugation> = Conjugation.fetchRequest()
        verbRequest.returnsObjectsAsFaults = false
        
        //sort descriptor
        let sortDescriptor = NSSortDescriptor(key: "conjugation", ascending: false)
        
        verbRequest.sortDescriptors = [sortDescriptor]

        
//        //predicates
//        let verbGroupCompoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateListVerb)
//        
//        let pronounsCompoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateListPronoun)
        
        let TenseCompoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateListTense)
        //
//        verbRequest.predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [verbGroupCompoundPredicate, pronounsCompoundPredicate])
        
        print(verbGroupCompoundPredicate)
        print(pronounsCompoundPredicate)
        
        var conjugationArray = [Conjugation]()
        
        do {
            try conjugationArray = moc.fetch(verbRequest)
            
        } catch {
            print(error)
        }
        
        for conjugation in conjugationArray {
            print("conjugation: \(conjugation.conjugation!)")
            //                    displayConjugations(verb:verb)
        }

        
        
     }
    
    
    
}
