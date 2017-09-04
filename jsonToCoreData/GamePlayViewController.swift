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
    
    lazy var conjugations = [Conjugation]()
    var conjugation: Conjugation? = nil
    var myArray = [String]()
    var searchPredicate: NSPredicate?
    var verbGroupSelected = 0
    var request: NSFetchRequest<Conjugation>?
    
    weak var managedObjectContext: NSManagedObjectContext! {
        didSet {
            return conjugation = Conjugation(context: managedObjectContext)
        }
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
        print(myArray)
    }

    //MARK: Private function
    
    private func loadData() {
        var predicates = [NSPredicate]()
    
        let verbPredicate = NSPredicate(format: "verbGroup = %@", verbGroupSelected)
        predicates.append(verbPredicate)
        
        if let additionalPredicate = searchPredicate {
            predicates.append(additionalPredicate)
        }
        
        let predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: predicates)
        request?.predicate = predicate
    
        conjugations = conjugation!.getConjugations(request: request!, moc: managedObjectContext)
        print(conjugations)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

//extension GamePlayViewController: OptionsVerbsTableViewController {
//    func updateGamePlayList(filterby: NSPredicate?){
//        if let filter = filterby {
//            searchPredicate = filter
//        }
//    }
//}
