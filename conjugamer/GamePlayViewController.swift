//
//  GamePlayViewController.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 9/2/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit
import CoreData

class GamePlayViewController: UIViewController {
    
    // MARK: Properties
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var gamePlayPredicated:GamePlayPredicates!
    
    //Verb Groups
    var predicateListVerb = [NSPredicate]()
    let predicateVerbGroup1 = NSPredicate(format: "verb.verbGroup == 1")
    let predicateVerbGroup2 = NSPredicate(format: "verb.verbGroup == 2")
    let predicateVerbGroup3 = NSPredicate(format: "verb.verbGroup == 3")
    
    //Pronouns
    var predicateListPronoun = [NSPredicate]()
    let predicateJe = NSPredicate(format: "pronoun == 0")
    let predicateTu = NSPredicate(format: "pronoun == 1")
    let predicateIl = NSPredicate(format: "pronoun == 2")
    //    let predicateElle = NSPredicate(format: "pronoun == 2")
    let predicateNous = NSPredicate(format: "pronoun == 3")
    let predicateVous = NSPredicate(format: "pronoun == 4")
    let predicateIls = NSPredicate(format: "pronoun == 5")
    //    let predicateElles = NSPredicate(format: "pronoun == 5")
    
    
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
    
    //Verb Mood & Tenses
    

    //Compound predicate
    var predicateIndPre:NSCompoundPredicate?
//    var predicateIndPC:NSCompoundPredicate?
    var predicateIndImp:NSCompoundPredicate?
//    var predicateIndPQP:NSCompoundPredicate?
    var predicateIndPS:NSCompoundPredicate?
//    var predicateIndPA:NSCompoundPredicate?
    var predicateIndFS:NSCompoundPredicate?
//    var predicateIndFA:NSCompoundPredicate?
    var predicateSubPre:NSCompoundPredicate?
//    var predicateSubPas:NSCompoundPredicate?
    var predicateSubImp:NSCompoundPredicate?
//    var predicateSubPQP:NSCompoundPredicate?
    var predicateConPre:NSCompoundPredicate?
//    var predicateConPas1:NSCompoundPredicate?
//    var predicateConPas2:NSCompoundPredicate?
    var predicateImpPre:NSCompoundPredicate?
//    var predicateImpPas:NSCompoundPredicate?
    var predicatePartPre:NSCompoundPredicate?
//    var predicatePartPas:NSCompoundPredicate?
    var predicateInfPre:NSCompoundPredicate?
//    var predicateInfPas:NSCompoundPredicate?
    var predicateGerPre:NSCompoundPredicate?
//    var predicateGerPas:NSCompoundPredicate?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamePlayPredicated = GamePlayPredicates()
        gamePlayPredicated.delegate = self
        let predicates = gamePlayPredicated.combineMoodTense()
        
        gamePlayPredicated.setupFetchRequest(predicates:predicates)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        
//        predicateIndPre = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates:[predicateInd,predicatePre])
//        predicateIndImp = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates:[predicateInd,predicateImp])
//        
//        setupFetchRequest()
    }
    
 
    
    
    
    
    func setupFetchRequest(){
        
        // Verb Groups
        let isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
        let isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
        let isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
        
        //Pronouns
        let isJeOn = UserDefaults.standard.bool(forKey: "isJeOn")
        let isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
        let isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
        //        let isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
        let isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
        let isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
        let isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
        //        let isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
        
        //Pronouns
        let isIndPreOn = UserDefaults.standard.bool(forKey: "isIndPreOn")
//        let isIndPCOn = UserDefaults.standard.bool(forKey: "isIndPCOn")
        let isIndImpOn = UserDefaults.standard.bool(forKey: "isIndImpOn")
//        let isIndPQPOn = UserDefaults.standard.bool(forKey: "isIndPQPOn")
//        let isIndPSOn = UserDefaults.standard.bool(forKey: "isIndPSOn")
//        let isIndPAOn = UserDefaults.standard.bool(forKey: "isIndPAOn")
//        let isIndFSOn = UserDefaults.standard.bool(forKey: "isIndFSOn")
//        let isIndFAOn = UserDefaults.standard.bool(forKey: "isIndFAOn")
//        let isSubPreOn = UserDefaults.standard.bool(forKey: "isSubPreOn")
//        let isSubPasOn = UserDefaults.standard.bool(forKey: "isSubPasOn")
//        let isSubImpOn = UserDefaults.standard.bool(forKey: "isSubImpOn")
//        let isSubPQPOn = UserDefaults.standard.bool(forKey: "isSubPQPOn")
//        let isConPreOn = UserDefaults.standard.bool(forKey: "isConPreOn")
//        let isConPas1On = UserDefaults.standard.bool(forKey: "isConPas1On")
//        let isConPas2On = UserDefaults.standard.bool(forKey: "isConPas2On")
//        let isImpPreOn = UserDefaults.standard.bool(forKey: "isImpPreOn")
//        let isImpPasOn = UserDefaults.standard.bool(forKey: "isImpPasOn")
//        let isPartPreOn = UserDefaults.standard.bool(forKey: "isPartPreOn")
//        let isPartPasOn = UserDefaults.standard.bool(forKey: "isPartPasOn")
//        let isInfPreOn = UserDefaults.standard.bool(forKey: "isInfPreOn")
//        let isInfPasOn = UserDefaults.standard.bool(forKey: "isInfPasOn")
//        let isGerPreOn = UserDefaults.standard.bool(forKey: "isGerPreOn")
//        let isGerPasOn = UserDefaults.standard.bool(forKey: "isGerPasOn")
        
        //check all options booleans
        // Verb Groups
        if isGroup1On {
            predicateListVerb.append(predicateVerbGroup1)
        }
        if isGroup2On {
            predicateListVerb.append(predicateVerbGroup2)
        }
        if isGroup3On {
            predicateListVerb.append(predicateVerbGroup3)
        }
        
        
        // Pronouns
        if isJeOn {
            predicateListPronoun.append(predicateJe)
        }
        if isTuOn {
            predicateListPronoun.append(predicateTu)
        }
        if isIlOn {
            predicateListPronoun.append(predicateIl)
        }
        //        if isElleOn {
        //            predicateListPronoun.append(predicateElle)
        //        }
        if isNousOn {
            predicateListPronoun.append(predicateNous)
        }
        if isVousOn {
            predicateListPronoun.append(predicateVous)
        }
        if isIlsOn {
            predicateListPronoun.append(predicateIls)
        }
        //        if isEllesOn {
        //            predicateListPronoun.append(predicateElles)
        //        }
//        
//        print(predicateListPronoun)
//        print(predicateListVerb)
        
        // Tenses
        if isIndPreOn {
            predicateListTense.append(predicateIndPre!)
        }
        if isIndImpOn {
            predicateListTense.append(predicateIndImp!)
        }


        
        let verbRequest:NSFetchRequest<Conjugation> = Conjugation.fetchRequest()
        verbRequest.returnsObjectsAsFaults = false
        
        //sort descriptor
        let sortDescriptor = NSSortDescriptor(key: "conjugation", ascending: false)
        
        //predicates
        let verbGroupCompoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateListVerb)
        
        let pronounsCompoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateListPronoun)
        
        let tenseCompoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateListTense)

        
        verbRequest.sortDescriptors = [sortDescriptor]
        
        verbRequest.predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [verbGroupCompoundPredicate, pronounsCompoundPredicate, tenseCompoundPredicate])
        
        print(verbGroupCompoundPredicate)
        print(pronounsCompoundPredicate)
        print(tenseCompoundPredicate)
        
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
        print("done in gpvc")
        gotConjugations(arr: conjugationArray)
        
    }
    
    
    func gotConjugations(arr:[Conjugation]){
        
        
        print("processing donem got \(arr.count) items")
    }
    
    //    func displayConjugations (verb:Verb) {
    //
    //        if let conjugationList = verb.conjugation as? Set<Verb> {
    //            for conjugation in conjugationList {
    //                print(conjugation.conjugation!)
    //            }
    //        }
    //    }
    
    
    
    //    // MARK: - Navigation
    //
    //    // In a storyboard-based applicatioENn, you will often want to do a little preparation before navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        // Get the new view controller using segue.destinationViewController.
    //        // Pass the selected object to the new view controller.
    //        }
    
}

extension GamePlayViewController : GameplayPredicatesDelegate{
    
    func done() {
        print("done in delegate method \(gamePlayPredicated)")
    }
    
}
