//
//  ViewController.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 8/24/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var Questions = []
//    var QNumber = Int()
    
    
    var selectedConjugations = ["this", "that"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gamePlayViewController: GamePlayViewController = segue.destination as! GamePlayViewController
        gamePlayViewController.myArray = selectedConjugations
    }
    
    
//    func PickQuestion() {
//
//        if Questions.count > 0 {
//            QNumber = arc4random() % Questions.count
//
//            Questions.remove(at: QNumber)
//            
//        }
//    
//
//    
//    }

    

}

