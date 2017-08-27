//
//  AppDelegate.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/24/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        removeData ()
        processJSON()

        let moc = persistentContainer.viewContext

        let verbRequest:NSFetchRequest<Verb> = Verb.fetchRequest()
        verbRequest.returnsObjectsAsFaults = false
        
        let sortDescriptor = NSSortDescriptor(key: "infinitive", ascending: false)
        
        let keyPath = "infinitive"
        let searchString = "vexer"
        
        let verbPredicate = NSPredicate(format: "%K CONTAINS %@", keyPath, searchString)
        
        verbRequest.sortDescriptors = [sortDescriptor]
        verbRequest.predicate = verbPredicate
        
        
        var verbArray = [Verb]()
        
        do {
            try verbArray = moc.fetch(verbRequest)
            
        } catch {
            print(error)
        }
        
        for verb in verbArray {
            print("verb:\(verb.infinitive!)")
            displayConjugations(verb:verb)
        }
        
        return true
    }
    
    func displayConjugations (verb:Verb) {
    
        if let conjugationList = verb.conjugation as? Set<Conjugation> {
            for conjugation in conjugationList {
                print(conjugation.conjugation!)
            }
        }
        
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack
    

    func processJSON(){
        
        let moc = persistentContainer.viewContext
        do{
            let url = Bundle.main.url(forResource: "verbsList", withExtension: "json")
            let string = try String(contentsOf: url!)
            let data = string.data(using: .utf8)
            do{
                let parsed = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [Dictionary<String,String>]
                for item in parsed{
                    
                    guard let inf = item["infinitif"] else {
                        fatalError("no inf")
                    }
                    
                    guard let grp = item["groupe"] else {
                        fatalError("no grp")
                    }
                    
                    guard let ger = item["gérondif"] else {
                        fatalError("no ger")
                    }
                    
                    guard let partPre = item["participe|présent"] else {
                        fatalError("no partPre")
                    }

                    guard let partPas = item["participe|passé"] else {
                        fatalError("no partPas")
                    }

                    guard let aux = item["auxiliare"] else {
                        fatalError("no aux")
                    }
                    
                    guard let indPreJe = item["indicatif|présent|je"] else {
                        fatalError("no indPreJe")
                    }

                    guard let indPreTu = item["indicatif|présent|tu"] else {
                        fatalError("no indPreTu")
                    }
                    
                    guard let indPreIl = item["indicatif|présent|il"] else {
                        fatalError("no indPreIl")
                    }
                    
                    guard let indPreNous = item["indicatif|présent|nous"] else {
                        fatalError("no indPreNous")
                    }
                    
                    guard let indPreVous = item["indicatif|présent|vous"] else {
                        fatalError("no indPreVous")
                    }
                    
                    guard let indPreIls = item["indicatif|présent|ils"] else {
                        fatalError("no indPreIls")
                    }
                    
                    guard let indImpJe = item["indicatif|imparfait|je"] else {
                        fatalError("no indImpJe")
                    }
                    
                    guard let indImpTu = item["indicatif|imparfait|tu"] else {
                        fatalError("no indImpTu")
                    }
                    
                    guard let indImpIl = item["indicatif|imparfait|il"] else {
                        fatalError("no indImpIl")
                    }
                    
                    guard let indImpNous = item["indicatif|imparfait|nous"] else {
                        fatalError("no indImpNous")
                    }
                    
                    guard let indImpVous = item["indicatif|imparfait|vous"] else {
                        fatalError("no indImpVous")
                    }
                    
                    guard let indImpIls = item["indicatif|imparfait|ils"] else {
                        fatalError("no indImpIls")
                    }
                    
                    guard let indPSJe = item["indicatif|passé simple|je"] else {
                        fatalError("no indPSJe")
                    }
                    
                    guard let indPSTu = item["indicatif|passé simple|tu"] else {
                        fatalError("no indPSTu")
                    }
                    
                    guard let indPSIl = item["indicatif|passé simple|il"] else {
                        fatalError("no indPSIl")
                    }
                    
                    guard let indPSNous = item["indicatif|passé simple|nous"] else {
                        fatalError("no indPSNous")
                    }
                    
                    guard let indPSVous = item["indicatif|passé simple|vous"] else {
                        fatalError("no indPSVous")
                    }
                    
                    guard let indPSIls = item["indicatif|passé simple|ils"] else {
                        fatalError("no indPSIls")
                    }
                    
                    guard let indFSJe = item["indicatif|futur simple|je"] else {
                        fatalError("no indFSJe")
                    }
                    
                    guard let indFSTu = item["indicatif|futur simple|tu"] else {
                        fatalError("no indFSTu")
                    }
                    
                    guard let indFSIl = item["indicatif|futur simple|il"] else {
                        fatalError("no indFSIl")
                    }
                    
                    guard let indFSNous = item["indicatif|futur simple|nous"] else {
                        fatalError("no indFSNous")
                    }
                    
                    guard let indFSVous = item["indicatif|futur simple|vous"] else {
                        fatalError("no indFSVous")
                    }
                    
                    guard let indFSIls = item["indicatif|futur simple|ils"] else {
                        fatalError("no indFSIls")
                    }
                    
                    guard let indConJe = item["indicatif|conditionnel|je"] else {
                        fatalError("no indConJe")
                    }
                    
                    guard let indConTu = item["indicatif|conditionnel|tu"] else {
                        fatalError("no indConTu")
                    }
                    
                    guard let indConIl = item["indicatif|conditionnel|il"] else {
                        fatalError("no indConIl")
                    }
                    
                    guard let indConNous = item["indicatif|conditionnel|nous"] else {
                        fatalError("no indConNous")
                    }
                    
                    guard let indConVous = item["indicatif|conditionnel|vous"] else {
                        fatalError("no indConVous")
                    }
                    
                    guard let indConIls = item["indicatif|conditionnel|ils"] else {
                        fatalError("no indConIls")
                    }
                    
                    guard let subPreJe = item["subjonctif|présent|je"] else {
                        fatalError("no subPreJe")
                    }
                    
                    guard let subPreTu = item["subjonctif|présent|tu"] else {
                        fatalError("no subPreTu")
                    }
                    
                    guard let subPreIl = item["subjonctif|présent|il"] else {
                        fatalError("no subPreIl")
                    }
                    
                    guard let subPreNous = item["subjonctif|présent|nous"] else {
                        fatalError("no subPreNous")
                    }
                    
                    guard let subPreVous = item["subjonctif|présent|vous"] else {
                        fatalError("no subPreVous")
                    }
                    
                    guard let subPreIls = item["subjonctif|présent|ils"] else {
                        fatalError("no subPreIls")
                    }
                    
                    guard let subImpJe = item["subjonctif|imparfait|je"] else {
                        fatalError("no subImpJe")
                    }
                    
                    guard let subImpTu = item["subjonctif|imparfait|tu"] else {
                        fatalError("no subImpTu")
                    }
                    
                    guard let subImpIl = item["subjonctif|imparfait|il"] else {
                        fatalError("no subImpIl")
                    }
                    
                    guard let subImpNous = item["subjonctif|imparfait|nous"] else {
                        fatalError("no subImpNous")
                    }
                    
                    guard let subImpVous = item["subjonctif|imparfait|vous"] else {
                        fatalError("no subImpVous")
                    }
                    
                    guard let subImpIls = item["subjonctif|imparfait|ils"] else {
                        fatalError("no subImpIls")
                    }
                    
                    guard let impTu = item["impératif|tu"] else {
                        fatalError("no impTu")
                    }
                    
                    guard let impNous = item["impératif|nous"] else {
                        fatalError("no impNous")
                    }
                    
                    guard let impVous = item["impératif|vous"] else {
                        fatalError("no impVous")
                    }
                    


                    // Verb object initialization
                    let verbObject = Verb(context: moc)
                    verbObject.infinitive = inf
                    
                    switch grp {
                    case "1":
                        verbObject.verbGroup = 1
                        verbObject.isRegular = true
                    case "2":
                        verbObject.verbGroup = 2
                        verbObject.isRegular = true
                    case "3":
                        verbObject.verbGroup = 3
                        verbObject.isRegular = false
                    default:
                        print("error assigning verb group for \(inf)")
                    }
                    
                    switch aux {
                    case "être":
                        verbObject.auxiliary = 0
                    case "avoir":
                        verbObject.auxiliary = 1
                    case "avoir;être":
                        verbObject.auxiliary = 2
                    default:
                        verbObject.auxiliary = 3
                        print("error assigning auxiliary group for \(inf)")
                    }
                    
                    
                    
                    // Ger object initialization
                    let conjugationObjectGer = Conjugation(context: moc)
                    conjugationObjectGer.conjugation = ger
                    conjugationObjectGer.verbMood = 0
//                    conjugationObject.tense =
//                    conjugationObject.pronoun =
                    
                    verbObject.addToConjugation(conjugationObjectGer)
                    
                    // PartPre object initialization
                    let conjugationObjectPartPre = Conjugation(context: moc)
                    conjugationObjectPartPre.conjugation = partPre
                    conjugationObjectPartPre.verbMood = 1
//                    conjugationObjectPartPre.tense = 
//                    conjugationObjectPartPre.pronoun =
                    
                    verbObject.addToConjugation(conjugationObjectPartPre)

                    // PartPas object initialization
                    let conjugationObjectPartPas = Conjugation(context: moc)
                    conjugationObjectPartPas.conjugation = partPas
                    conjugationObjectPartPas.verbMood = 1
//                    conjugationObjectPartPas.tense =
//                    conjugationObjectPartPas.pronoun =
                    
                    verbObject.addToConjugation(conjugationObjectPartPas)
                    
                    // IndPreJe object initialization
                    let conjugationObjectIndPreJe = Conjugation(context: moc)
                    conjugationObjectIndPreJe.conjugation = indPreJe
                    conjugationObjectIndPreJe.verbMood = 2
                    conjugationObjectIndPreJe.tense = 0
                    conjugationObjectIndPreJe.pronoun = 0
                    
                    verbObject.addToConjugation(conjugationObjectIndPreJe)
                
                    // IndPreTu object initialization
                    let conjugationObjectIndPreTu = Conjugation(context: moc)
                    conjugationObjectIndPreTu.conjugation = indPreTu
                    conjugationObjectIndPreTu.verbMood = 2
                    conjugationObjectIndPreTu.tense = 0
                    conjugationObjectIndPreTu.pronoun = 1
                    
                    verbObject.addToConjugation(conjugationObjectIndPreTu)
                    
                    // IndPreIl object initialization
                    let conjugationObjectIndPreIl = Conjugation(context: moc)
                    conjugationObjectIndPreIl.conjugation = indPreIl
                    conjugationObjectIndPreIl.verbMood = 2
                    conjugationObjectIndPreIl.tense = 0
                    conjugationObjectIndPreIl.pronoun = 2
                    
                    verbObject.addToConjugation(conjugationObjectIndPreIl)
                    
                    // IndPreNous object initialization
                    let conjugationObjectIndPreNous = Conjugation(context: moc)
                    conjugationObjectIndPreNous.conjugation = indPreNous
                    conjugationObjectIndPreNous.verbMood = 2
                    conjugationObjectIndPreNous.tense = 0
                    conjugationObjectIndPreNous.pronoun = 3
                    
                    verbObject.addToConjugation(conjugationObjectIndPreNous)
                    
                    // IndPreVous object initialization
                    let conjugationObjectIndPreVous = Conjugation(context: moc)
                    conjugationObjectIndPreVous.conjugation = indPreVous
                    conjugationObjectIndPreVous.verbMood = 2
                    conjugationObjectIndPreVous.tense = 0
                    conjugationObjectIndPreVous.pronoun = 4
                    
                    verbObject.addToConjugation(conjugationObjectIndPreVous)
                    
                    // IndPreIls object initialization
                    let conjugationObjectIndPreIls = Conjugation(context: moc)
                    conjugationObjectIndPreIls.conjugation = indPreIls
                    conjugationObjectIndPreIls.verbMood = 2
                    conjugationObjectIndPreIls.tense = 0
                    conjugationObjectIndPreIls.pronoun = 5
                    
                    verbObject.addToConjugation(conjugationObjectIndPreIls)
                    
                    // IndImpJe object initialization
                    let conjugationObjectIndImpJe = Conjugation(context: moc)
                    conjugationObjectIndImpJe.conjugation = indImpJe
                    conjugationObjectIndImpJe.verbMood = 2
                    conjugationObjectIndImpJe.tense = 1
                    conjugationObjectIndImpJe.pronoun = 0
                    
                    verbObject.addToConjugation(conjugationObjectIndImpJe)
                    
                    // IndImpTu object initialization
                    let conjugationObjectIndImpTu = Conjugation(context: moc)
                    conjugationObjectIndImpTu.conjugation = indImpTu
                    conjugationObjectIndImpTu.verbMood = 2
                    conjugationObjectIndImpTu.tense = 1
                    conjugationObjectIndImpTu.pronoun = 1
                    
                    verbObject.addToConjugation(conjugationObjectIndImpTu)
                    
                    // indImpIl object initialization
                    let conjugationObjectIndImpIl = Conjugation(context: moc)
                    conjugationObjectIndImpIl.conjugation = indImpIl
                    conjugationObjectIndImpIl.verbMood = 2
                    conjugationObjectIndImpIl.tense = 1
                    conjugationObjectIndImpIl.pronoun = 2
                    
                    verbObject.addToConjugation(conjugationObjectIndImpIl)
                    
                    // IndImpNous object initialization
                    let conjugationObjectIndImpNous = Conjugation(context: moc)
                    conjugationObjectIndImpNous.conjugation = indImpNous
                    conjugationObjectIndImpNous.verbMood = 2
                    conjugationObjectIndImpNous.tense = 1
                    conjugationObjectIndImpNous.pronoun = 3
                    
                    verbObject.addToConjugation(conjugationObjectIndImpNous)
                    
                    // IndImpVous object initialization
                    let conjugationObjectIndImpVous = Conjugation(context: moc)
                    conjugationObjectIndImpVous.conjugation = indImpVous
                    conjugationObjectIndImpVous.verbMood = 2
                    conjugationObjectIndImpVous.tense = 1
                    conjugationObjectIndImpVous.pronoun = 4
                    
                    verbObject.addToConjugation(conjugationObjectIndImpVous)
                    
                    // IndImpIls object initialization
                    let conjugationObjectIndImpIls = Conjugation(context: moc)
                    conjugationObjectIndImpIls.conjugation = indImpIls
                    conjugationObjectIndImpIls.verbMood = 2
                    conjugationObjectIndImpIls.tense = 1
                    conjugationObjectIndImpIls.pronoun = 5
                    
                    verbObject.addToConjugation(conjugationObjectIndImpIls)
                    
                    // IndPSJe object initialization
                    let conjugationObjectIndPSJe = Conjugation(context: moc)
                    conjugationObjectIndPSJe.conjugation = indPSJe
                    conjugationObjectIndPSJe.verbMood = 2
                    conjugationObjectIndPSJe.tense = 2
                    conjugationObjectIndPSJe.pronoun = 0
                    
                    verbObject.addToConjugation(conjugationObjectIndPSJe)
                    
                    // IndPSTu object initialization
                    let conjugationObjectIndPSTu = Conjugation(context: moc)
                    conjugationObjectIndPSTu.conjugation = indPSTu
                    conjugationObjectIndPSTu.verbMood = 2
                    conjugationObjectIndPSTu.tense = 2
                    conjugationObjectIndPSTu.pronoun = 1
                    
                    verbObject.addToConjugation(conjugationObjectIndPSTu)
                    
                    // IndPSIl object initialization
                    let conjugationObjectIndPSIl = Conjugation(context: moc)
                    conjugationObjectIndPSIl.conjugation = indPSIl
                    conjugationObjectIndPSIl.verbMood = 2
                    conjugationObjectIndPSIl.tense = 2
                    conjugationObjectIndPSIl.pronoun = 2
                    
                    verbObject.addToConjugation(conjugationObjectIndPSIl)
                    
                    // IndPSNous object initialization
                    let conjugationObjectIndPSNous = Conjugation(context: moc)
                    conjugationObjectIndPSNous.conjugation = indPSNous
                    conjugationObjectIndPSNous.verbMood = 2
                    conjugationObjectIndPSNous.tense = 2
                    conjugationObjectIndPSNous.pronoun = 3
                    
                    verbObject.addToConjugation(conjugationObjectIndPSNous)
                    
                    // IndPSVous object initialization
                    let conjugationObjectIndPSVous = Conjugation(context: moc)
                    conjugationObjectIndPSVous.conjugation = indPSVous
                    conjugationObjectIndPSVous.verbMood = 2
                    conjugationObjectIndPSVous.tense = 2
                    conjugationObjectIndPSVous.pronoun = 4
                    
                    verbObject.addToConjugation(conjugationObjectIndPSVous)
                    
                    // IndPSIls object initialization
                    let conjugationObjectIndPSIls = Conjugation(context: moc)
                    conjugationObjectIndPSIls.conjugation = indPSIls
                    conjugationObjectIndPSIls.verbMood = 2
                    conjugationObjectIndPSIls.tense = 2
                    conjugationObjectIndPSIls.pronoun = 5
                    
                    verbObject.addToConjugation(conjugationObjectIndPSIls)
                    
                    // IndFSJe object initialization
                    let conjugationObjectIndFSJe = Conjugation(context: moc)
                    conjugationObjectIndFSJe.conjugation = indFSJe
                    conjugationObjectIndFSJe.verbMood = 2
                    conjugationObjectIndFSJe.tense = 3
                    conjugationObjectIndFSJe.pronoun = 0
                    
                    verbObject.addToConjugation(conjugationObjectIndFSJe)
                    
                    // IndFSTu object initialization
                    let conjugationObjectIndFSTu = Conjugation(context: moc)
                    conjugationObjectIndFSTu.conjugation = indFSTu
                    conjugationObjectIndFSTu.verbMood = 2
                    conjugationObjectIndFSTu.tense = 3
                    conjugationObjectIndFSTu.pronoun = 1
                    
                    verbObject.addToConjugation(conjugationObjectIndFSTu)
                    
                    // IndFSIl object initialization
                    let conjugationObjectIndFSIl = Conjugation(context: moc)
                    conjugationObjectIndFSIl.conjugation = indFSIl
                    conjugationObjectIndFSIl.verbMood = 2
                    conjugationObjectIndFSIl.tense = 3
                    conjugationObjectIndFSIl.pronoun = 2
                    
                    verbObject.addToConjugation(conjugationObjectIndFSIl)
                    
                    // IndFSNous object initialization
                    let conjugationObjectIndFSNous = Conjugation(context: moc)
                    conjugationObjectIndFSNous.conjugation = indFSNous
                    conjugationObjectIndFSNous.verbMood = 2
                    conjugationObjectIndFSNous.tense = 3
                    conjugationObjectIndFSNous.pronoun = 3
                    
                    verbObject.addToConjugation(conjugationObjectIndFSNous)
                    
                    // IndFSVous object initialization
                    let conjugationObjectIndFSVous = Conjugation(context: moc)
                    conjugationObjectIndFSVous.conjugation = indFSVous
                    conjugationObjectIndFSVous.verbMood = 2
                    conjugationObjectIndFSVous.tense = 3
                    conjugationObjectIndFSVous.pronoun = 4
                    
                    verbObject.addToConjugation(conjugationObjectIndFSVous)
                    
                    // IndFSIls object initialization
                    let conjugationObjectIndFSIls = Conjugation(context: moc)
                    conjugationObjectIndFSIls.conjugation = indFSIls
                    conjugationObjectIndFSIls.verbMood = 2
                    conjugationObjectIndFSIls.tense = 3
                    conjugationObjectIndFSIls.pronoun = 5
                    
                    verbObject.addToConjugation(conjugationObjectIndFSIls)
                    
                    // IndConJe object initialization
                    let conjugationObjectIndConJe = Conjugation(context: moc)
                    conjugationObjectIndConJe.conjugation = indConJe
                    conjugationObjectIndConJe.verbMood = 2
                    conjugationObjectIndConJe.tense = 4
                    conjugationObjectIndConJe.pronoun = 0
                    
                    verbObject.addToConjugation(conjugationObjectIndConJe)
                    
                    // IndConTu object initialization
                    let conjugationObjectIndConTu = Conjugation(context: moc)
                    conjugationObjectIndConTu.conjugation = indConTu
                    conjugationObjectIndConTu.verbMood = 2
                    conjugationObjectIndConTu.tense = 4
                    conjugationObjectIndConTu.pronoun = 1
                    
                    verbObject.addToConjugation(conjugationObjectIndConTu)
                    
                    // IndConIl object initialization
                    let conjugationObjectIndConIl = Conjugation(context: moc)
                    conjugationObjectIndConIl.conjugation = indConIl
                    conjugationObjectIndConIl.verbMood = 2
                    conjugationObjectIndConIl.tense = 4
                    conjugationObjectIndConIl.pronoun = 2
                    
                    verbObject.addToConjugation(conjugationObjectIndConIl)
                    
                    // IndConNous object initialization
                    let conjugationObjectIndConNous = Conjugation(context: moc)
                    conjugationObjectIndConNous.conjugation = indConNous
                    conjugationObjectIndConNous.verbMood = 2
                    conjugationObjectIndConNous.tense = 4
                    conjugationObjectIndConNous.pronoun = 3
                    
                    verbObject.addToConjugation(conjugationObjectIndConNous)
                    
                    // IndConVous object initialization
                    let conjugationObjectIndConVous = Conjugation(context: moc)
                    conjugationObjectIndConVous.conjugation = indConVous
                    conjugationObjectIndConVous.verbMood = 2
                    conjugationObjectIndConVous.tense = 4
                    conjugationObjectIndConVous.pronoun = 4
                    
                    verbObject.addToConjugation(conjugationObjectIndConVous)
                    
                    // IndConIls object initialization
                    let conjugationObjectIndConIls = Conjugation(context: moc)
                    conjugationObjectIndConIls.conjugation = indConIls
                    conjugationObjectIndConIls.verbMood = 2
                    conjugationObjectIndConIls.tense = 4
                    conjugationObjectIndConIls.pronoun = 5
                    
                    verbObject.addToConjugation(conjugationObjectIndConIls)
                    
                    // SubPreJe object initialization
                    let conjugationObjectSubPreJe = Conjugation(context: moc)
                    conjugationObjectSubPreJe.conjugation = subPreJe
                    conjugationObjectSubPreJe.verbMood = 3
                    conjugationObjectSubPreJe.tense = 0
                    conjugationObjectSubPreJe.pronoun = 0
                    
                    verbObject.addToConjugation(conjugationObjectSubPreJe)
                    
                    // SubPreTu object initialization
                    let conjugationObjectSubPreTu = Conjugation(context: moc)
                    conjugationObjectSubPreTu.conjugation = subPreTu
                    conjugationObjectSubPreTu.verbMood = 3
                    conjugationObjectSubPreTu.tense = 0
                    conjugationObjectSubPreTu.pronoun = 1
                    
                    verbObject.addToConjugation(conjugationObjectSubPreTu)
                    
                    // SubPreIl object initialization
                    let conjugationObjectSubPreIl = Conjugation(context: moc)
                    conjugationObjectSubPreIl.conjugation = subPreIl
                    conjugationObjectSubPreIl.verbMood = 3
                    conjugationObjectSubPreIl.tense = 0
                    conjugationObjectSubPreIl.pronoun = 2
                    
                    verbObject.addToConjugation(conjugationObjectSubPreIl)
                    
                    // SubPreNous object initialization
                    let conjugationObjectSubPreNous = Conjugation(context: moc)
                    conjugationObjectSubPreNous.conjugation = subPreNous
                    conjugationObjectSubPreNous.verbMood = 3
                    conjugationObjectSubPreNous.tense = 0
                    conjugationObjectSubPreNous.pronoun = 3
                    
                    verbObject.addToConjugation(conjugationObjectSubPreNous)
                    
                    // SubPreVous object initialization
                    let conjugationObjectSubPreVous = Conjugation(context: moc)
                    conjugationObjectSubPreVous.conjugation = subPreVous
                    conjugationObjectSubPreVous.verbMood = 3
                    conjugationObjectSubPreVous.tense = 0
                    conjugationObjectSubPreVous.pronoun = 4
                    
                    verbObject.addToConjugation(conjugationObjectSubPreVous)
                    
                    // SubPreIls object initialization
                    let conjugationObjectSubPreIls = Conjugation(context: moc)
                    conjugationObjectSubPreIls.conjugation = subPreIls
                    conjugationObjectSubPreIls.verbMood = 3
                    conjugationObjectSubPreIls.tense = 0
                    conjugationObjectSubPreIls.pronoun = 5
                    
                    verbObject.addToConjugation(conjugationObjectSubPreIls)
                    
                    // SubImpJe object initialization
                    let conjugationObjectSubImpJe = Conjugation(context: moc)
                    conjugationObjectSubImpJe.conjugation = subImpJe
                    conjugationObjectSubImpJe.verbMood = 3
                    conjugationObjectSubImpJe.tense = 1
                    conjugationObjectSubImpJe.pronoun = 0
                    
                    verbObject.addToConjugation(conjugationObjectSubImpJe)
                    
                    // SubImpTu object initialization
                    let conjugationObjectSubImpTu = Conjugation(context: moc)
                    conjugationObjectSubImpTu.conjugation = subImpTu
                    conjugationObjectSubImpTu.verbMood = 3
                    conjugationObjectSubImpTu.tense = 1
                    conjugationObjectSubImpTu.pronoun = 1
                    
                    verbObject.addToConjugation(conjugationObjectSubImpTu)
                    
                    // SubImpIl object initialization
                    let conjugationObjectSubImpIl = Conjugation(context: moc)
                    conjugationObjectSubImpIl.conjugation = subImpIl
                    conjugationObjectSubImpIl.verbMood = 3
                    conjugationObjectSubImpIl.tense = 1
                    conjugationObjectSubImpIl.pronoun = 2
                    
                    verbObject.addToConjugation(conjugationObjectSubImpIl)
                    
                    // SubImpNous object initialization
                    let conjugationObjectSubImpNous = Conjugation(context: moc)
                    conjugationObjectSubImpNous.conjugation = subImpNous
                    conjugationObjectSubImpNous.verbMood = 3
                    conjugationObjectSubImpNous.tense = 1
                    conjugationObjectSubImpNous.pronoun = 3
                    
                    verbObject.addToConjugation(conjugationObjectSubImpNous)
                    
                    // SubImpVous object initialization
                    let conjugationObjectSubImpVous = Conjugation(context: moc)
                    conjugationObjectSubImpVous.conjugation = subImpVous
                    conjugationObjectSubImpVous.verbMood = 3
                    conjugationObjectSubImpVous.tense = 1
                    conjugationObjectSubImpVous.pronoun = 4
                    
                    verbObject.addToConjugation(conjugationObjectSubImpVous)
                    
                    // SubImpIls object initialization
                    let conjugationObjectSubImpIls = Conjugation(context: moc)
                    conjugationObjectSubImpIls.conjugation = subImpIls
                    conjugationObjectSubImpIls.verbMood = 3
                    conjugationObjectSubImpIls.tense = 1
                    conjugationObjectSubImpIls.pronoun = 5
                    
                    verbObject.addToConjugation(conjugationObjectSubImpIls)
                    
                    // ImpTu object initialization
                    let conjugationObjectImpTu = Conjugation(context: moc)
                    conjugationObjectImpTu.conjugation = impTu
                    conjugationObjectImpTu.verbMood = 4
//                    conjugationObjectImpTu.tense =
                    conjugationObjectImpTu.pronoun = 1
                    
                    verbObject.addToConjugation(conjugationObjectImpTu)
                    
                    // ImpNous object initialization
                    let conjugationObjectImpNous = Conjugation(context: moc)
                    conjugationObjectImpNous.conjugation = impNous
                    conjugationObjectImpNous.verbMood = 4
//                    conjugationObjectImpNous.tense =
                    conjugationObjectImpNous.pronoun = 3
                    
                    verbObject.addToConjugation(conjugationObjectImpNous)
                    
                    // ImpVous object initialization
                    let conjugationObjectImpVous = Conjugation(context: moc)
                    conjugationObjectImpVous.conjugation = impVous
                    conjugationObjectImpVous.verbMood = 4
//                    conjugationObjectImpVous.tense =
                    conjugationObjectImpVous.pronoun = 4
                    
                    verbObject.addToConjugation(conjugationObjectImpVous)

                    
                }
                
                try! moc.save()
            }
        } catch {
            print("didnt work")
        }


    }
    
    func displayConjugations ( ){
    
    
    }
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "jsonToCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Delete all
    
    func removeData () {
        // Remove the existing items
        let moc = persistentContainer.viewContext
        let verbRequest: NSFetchRequest<Verb> = Verb.fetchRequest()
        let conjugationRequest: NSFetchRequest<Conjugation> = Conjugation.fetchRequest()
        var deleteRequest: NSBatchDeleteRequest
        var deleteResults: NSPersistentStoreResult
        
        do {
            deleteRequest = NSBatchDeleteRequest(fetchRequest: verbRequest as! NSFetchRequest<NSFetchRequestResult>)
            deleteResults = try moc.execute(deleteRequest)
            
            deleteRequest = NSBatchDeleteRequest(fetchRequest: conjugationRequest as! NSFetchRequest<NSFetchRequestResult>)
            deleteResults = try moc.execute(deleteRequest)
            
        } catch {
            print(error)
        }
        
    }
    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

