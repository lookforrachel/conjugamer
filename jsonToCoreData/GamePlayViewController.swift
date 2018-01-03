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

    // TODO: set all defaults to true
    // MARK: Properties    
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
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
    
    //Tenses
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello world")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let isJeOn = UserDefaults.standard.bool(forKey: "isElleOn")
        let isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
        let isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
        let isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
        let isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
        let isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
        let isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
        let isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")

                    print("je: \(isJeOn)")
                    print("tu: \(isTuOn)")
                    print("il: \(isIlOn)")
                    print("elle: \(isElleOn)")
                    print("nous: \(isNousOn)")
                    print("vous: \(isVousOn)")
                    print("ils: \(isIlsOn)")
                    print("elles: \(isEllesOn)")
        
        setupFetchRequest()
    }

    func setupFetchRequest(){
        print("oh, hello")
        // Verb Groups
        let isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
        let isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
        let isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
        
        //Pronouns
        let isJeOn = UserDefaults.standard.bool(forKey: "isElleOn")
        let isTuOn = UserDefaults.standard.bool(forKey: "isTuOn")
        let isIlOn = UserDefaults.standard.bool(forKey: "isIlOn")
//        let isElleOn = UserDefaults.standard.bool(forKey: "isElleOn")
        let isNousOn = UserDefaults.standard.bool(forKey: "isNousOn")
        let isVousOn = UserDefaults.standard.bool(forKey: "isVousOn")
        let isIlsOn = UserDefaults.standard.bool(forKey: "isIlsOn")
//        let isEllesOn = UserDefaults.standard.bool(forKey: "isEllesOn")
        
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
    
        
        
        let verbRequest:NSFetchRequest<Conjugation> = Conjugation.fetchRequest()
        verbRequest.returnsObjectsAsFaults = false
        
        //sort descriptor
        let sortDescriptor = NSSortDescriptor(key: "conjugation", ascending: false)
        
        //predicates
        let verbGroupCompoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateListVerb)

        let pronounsCompoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateListPronoun)
        
        verbRequest.sortDescriptors = [sortDescriptor]

        verbRequest.predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [verbGroupCompoundPredicate, pronounsCompoundPredicate])
        
        var conjugationArray = [Conjugation]()
        
        do {
            try conjugationArray = moc.fetch(verbRequest)
            //print("conjugation: \(conjugationArray)")
        } catch {
            print(error)
        }
        //print("seemed to work \(conjugationArray)")
        for conjugation in conjugationArray {
            if let verb = conjugation.verb{
                displayConjugations(verb:verb)
            }
            
        }
    }
    
    func displayConjugations (verb:Verb) {
        
        if let conjugationList = verb.conjugation as? Set<Verb> {
            for conjugation in conjugationList {
                print(conjugation.conjugation!)
            }
        } else {
            print("pass")
        }
    }


    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        }
    
}
