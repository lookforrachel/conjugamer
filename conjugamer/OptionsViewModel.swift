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
    private var processedOptions:[[Option]]!
    
    init(optionKey: OptionsMain){
        self.myOptions = Options(optionsMain: optionKey)
        processedOptions = processSections()
        print("processed options",processedOptions)
    }
    
    func returnOptions()->[Option]{
        return self.myOptions.options
    }
    
    func returnSections()->[String]?{
        return myOptions.keys
    }
    
    func returnProcessedSections()->[[Option]]?{
        return processedOptions
    }
    
    func processSections()->[[Option]]?{
        
        
        if let sections = returnSections(){
            //there are sections
            var outerArray:[[Option]] = [[Option]]()
            let options = returnOptions()
            
            for section in sections{
                var innerArray:[Option] = [Option]()
                for myOption in options{
                    if (myOption.tensesSection == section){
                        innerArray.append((myOption))
                    }
                }
                outerArray.append(innerArray)
            }
            
            return outerArray
        } else {
            
            return nil
            
        }
        
        
        
    }
    
    func myCrazyCheckingFunction(cell:optionsViewCell,table:UITableView) -> Bool {
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
        
        var defaultsKey:String = ""
        
        if(returnSections() != nil){
            if let indexPath = table.indexPath(for: cell){
                let thisOption = processedOptions[indexPath.section][indexPath.row]
                thisOption.isOn = cell.cellSwitch.isOn
                defaultsKey = thisOption.defaultsKey
            }
        } else {
            defaultsKey = returnOptions()[cell.cellSwitch.tag].defaultsKey
            myOptions.options[cell.cellSwitch.tag].isOn = cell.cellSwitch.isOn
        }
        
        
        //print("changing \(cell.cellSwitch.tag) \(myOptions.options[cell.cellSwitch.tag].isOn)")
        
        UserDefaults.standard.set(cell.cellSwitch.isOn, forKey: defaultsKey)
        
        
        
        return true
        
    }
}
