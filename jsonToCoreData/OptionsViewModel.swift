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
    private var myOptions: Options
    
    init(optionKey: OptionsMain){
        self.myOptions = Options(optionsMain: optionKey)
        
    }
    
    func returnOptions()->[Option]{
        return self.myOptions.options
    }
    
    func returnSections()->[String]?{
        return myOptions.keys
    }
    
    func myCrazyCheckingFunction(cell:optionsViewCell) -> Bool {
        print("called")
        if (cell.cellSwitch.isOn==false){
            var on = 0;
            
            for option in myOptions.options {
                
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
            myOptions.options[cell.cellSwitch.tag].isOn = cell.cellSwitch.isOn
            print("changing \(cell.cellSwitch.tag) \(myOptions.options[cell.cellSwitch.tag].isOn)")
            UserDefaults.standard.set(myOptions.options[cell.cellSwitch.tag].isOn, forKey: myOptions.options[cell.cellSwitch.tag].defaultsKey)

        
        
        return true
  
    }
}
