//
//  GamePlayPredicates.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 9/19/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import Foundation
import CoreData
import UIKit


protocol GameplayPredicatesDelegate{
    func dataReady()
}

class GamePlayPredicates {
    
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var delegate:GameplayPredicatesDelegate?
    
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
    
    var predicateIndPre: NSCompoundPredicate?
    var predicateIndImpa: NSCompoundPredicate?
    
    
    
    init() {
        
        print("oh hello")
        let optionsModel = OptionsViewModel(optionKey: .Tenses)
        for option in optionsModel.returnOptions(){
            print(option.name, option.isOn)
        }
        
        let predicates = combineMoodTense()
        
        setupFetchRequest(predicates:predicates)
        //let predicates = GamePlayPredicate()
    }
    
    
    
    func combineMoodTense() -> (pre:NSCompoundPredicate,impa:NSCompoundPredicate) {
        
        let predicateIndPre = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates:[predicateInd,predicatePre])
        let predicateIndImpa = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates:[predicateInd,predicateImpa])
        
        return (predicateIndPre,predicateIndImpa)
        
    }
    
    
    func setupFetchRequest(predicates:(pre:NSCompoundPredicate,impa:NSCompoundPredicate)){
        
        //Tenses
        let isIndPreOn = UserDefaults.standard.bool(forKey: "isIndPreOn")
        let isIndImpOn = UserDefaults.standard.bool(forKey: "isIndImpOn")
        
        // Tenses
        if isIndPreOn {
            predicateListTense.append(predicates.pre)
        }
        if isIndImpOn {
            predicateListTense.append(predicates.impa)
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
        verbRequest.predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [TenseCompoundPredicate])
        
        //        print(verbGroupCompoundPredicate)
        //        print(pronounsCompoundPredicate)
        
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
        print("done in thingy")
        delegate?.dataReady()
        
        
    }
    
    
    
}

class Pref {
    
    var name: String
    var defaultsKey: String
    var list: String
    var isOn: Bool
    
    init(name: String, defaultsKey: String, list: String){
        
        self.name = name
        self.defaultsKey = defaultsKey
        self.list = list
        self.isOn = UserDefaults.standard.bool(forKey: defaultsKey)
    }
}

//class Prefs {
//    var prefs = [Pref]()
//
//    guard let PredicatesListPlist = Bundle.main.url(forResource: "PredicatesList", withExtension: "plist") else {
//    fatalError()
//    }
//    guard let prefsArray = NSArray (contentsOf: optionsPlistDict) else {
//    fatalError()
//    }
//
//        for object in prefsArray{
//            let dict = object as! [String:String]
//
//    if let name = dict["name"], let defaultsKey = dict["userDefaults"], let list = dict["list"]
//
//    let thisPref = Pref(name: name, defaultsKey: defaultsKey,list: list)
//
//    prefs.append(thisPref)
//}
//
//class setupSingleProperties {
//
//}
//
//class setupCompoundProperties {
//    
//}
//
//class setupComCompoundProperties {
//    
//}
//
//class appendPredicateList {
//    
//}
