//
//  OptionsViewModel.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 9/10/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import UIKit
import Foundation




class OptionsViewModel {
    var myOptions: Options
    
    private let optionKeys = [
        "isGroup1On",
        "isGroup2On",
        "isGroup3On"
    ]
    
    init(){
        self.myOptions = Options()
    }
    
    func myCrazyCheckingFunction(cell:optionsViewCell) -> Bool {
        print("called")
        if (cell.cellSwitch.isOn==false){
            var on = 0;
            
            for option in myOptions.verbOptions {
                
                if (option.isOn){
                    on+=1
                }
                //maybe short circuit, if you want if(on>1){break;}
            }
            
            print("on \(on)")
            if (on==1){
                return false
            }
        }
        
        
            //set NSUD, set model,
            myOptions.verbOptions[cell.cellSwitch.tag].isOn = cell.cellSwitch.isOn
            print("changing \(cell.cellSwitch.tag) \(myOptions.verbOptions[cell.cellSwitch.tag].isOn)")
            UserDefaults.standard.set(myOptions.verbOptions[cell.cellSwitch.tag].isOn, forKey: optionKeys[cell.cellSwitch.tag])
        
        
        return true
        


        
    }
    
    var IsOnlyButtonOn: Bool {
//        if (isOn == true){
//            //save myOptions.isOn to true
//            UserDefaults.standard.set(true, forKey: "isGroup1On")
//            return Bool(isOn)
//        }
//        else if (isGroup2On || isGroup3On){
//            UserDefaults.standard.set(false, forKey: "isGroup1On")
//            print("group1 off")
//            isGroup1On = UserDefaults.standard.bool(forKey: "isGroup1On")
//            isGroup2On = UserDefaults.standard.bool(forKey: "isGroup2On")
//            isGroup3On = UserDefaults.standard.bool(forKey: "isGroup3On")
//        }
//        else {
//            group1Switch.setOn(true, animated: true)
//            createAlert(title: "!", message: "user must select at least one option")
//        }
        return false
    }
}
