//
//  GamePlayViewController.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 9/2/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit
import CoreData

class GamePlayViewController: UIViewController, SendVerbsDelegate {
    
    // MARK: Properties
    
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var predicateList = [NSPredicate]()
    let predicate1 = NSPredicate(format: "verbGroup == 1")
    let predicate2 = NSPredicate(format: "verbGroup == 2")
    let predicate3 = NSPredicate(format: "verbGroup == 3")
    
    func sendVerbs(data: String) {
        print(data)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
        let isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
        let isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
        
        print((isGroup1On) ? "GROUP ONE ON" : "GROUP ONE OFF")
        if isGroup1On {
            predicateList.append(predicate1)
        }
        if isGroup2On {
            predicateList.append(predicate2)
        }
        if isGroup3On {
            predicateList.append(predicate3)
        }
    
        let verbRequest:NSFetchRequest<Verb> = Verb.fetchRequest()
        verbRequest.returnsObjectsAsFaults = false

        let sortDescriptor = NSSortDescriptor(key: "verbGroup", ascending: false)

//                let keyPath = "verbGroup"
//                let searchString = "1"
//        
//                let verbPredicate = NSPredicate(format: "%K == %@", keyPath, searchString)

//        let verbCompoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: [predicate2])
//
//        predicateList.append(verbCompoundPredicate)

        verbRequest.sortDescriptors = [sortDescriptor]
        verbRequest.predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicateList)
//                verbRequest.predicate = verbPredicate


        var verbArray = [Verb]()

        do {
            try verbArray = moc.fetch(verbRequest)

        } catch {
            print(error)
        }

        for verb in verbArray {
            print("verb:\(verb.infinitive!)")
//                    displayConjugations(verb:verb)
        }
    }

    func displayConjugations (verb:Verb) {
        
        if let conjugationList = verb.conjugation as? Set<Conjugation> {
            for conjugation in conjugationList {
                print(conjugation.conjugation!)
            }
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



//extension GamePlayViewController: OptionsVerbsTableViewController {
//    func updateGamePlayList(filterby: NSPredicate?){
//        if let filter = filterby {
//            searchPredicate = filter
//        }
//    }
//}
