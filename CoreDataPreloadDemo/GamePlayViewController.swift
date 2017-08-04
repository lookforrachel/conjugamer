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
    @IBOutlet weak var textView: UITextView!
    var currentIndex: Int = 0
    @IBAction func checkAnswer(_ sender: Any) {
        
        if userInput.text == menuItems[currentIndex].verb {
            textView.text = "correct!"
            viewWillLayoutSubviews()
            userInput.text = nil
        }
        
        else {
         textView.text = "you're a dumbass, the correct answer is \(menuItems[currentIndex].verb ?? "error")"
        
        }
    }
    
    func randomNumberGenerator() -> Int {
        //generates random number from 0 to menuItems.count
        return Int(arc4random_uniform(UInt32(menuItems.count)+1))
    }
    
    override func viewWillLayoutSubviews() {
        currentIndex = self.randomNumberGenerator()
        verbLabel.text = menuItems[currentIndex].detail
        tenseLabel.text = menuItems[0].verb
   
        //name = id
        //verb = ind pre tu
        //price = ind pre je
        //detail = infinitive
        
    }
    
}
