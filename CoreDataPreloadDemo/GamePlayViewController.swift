//
//  GamePlayViewController.swift
//  CoreDataPreloadDemo
//
//  Created by Rachel Yee on 8/3/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import UIKit
import CoreData

class GamePlayViewController: UIViewController {

    fileprivate var menuItems:[MenuItem] = []
    var fetchResultController:NSFetchedResultsController<NSFetchRequestResult>!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load menu items from database
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MenuItem")
            do {
                menuItems = try managedObjectContext.fetch(fetchRequest) as! [MenuItem]
                //print(test(1))
            } catch {
                print("Failed to retrieve record")
                print(error)
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var verbLabel: UILabel!
    @IBOutlet weak var tenseLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    override func viewWillLayoutSubviews() {
        
        
        
        verbLabel.text = menuItems[1].verb
        tenseLabel.text = menuItems[1].detail

        
    }
    
}
