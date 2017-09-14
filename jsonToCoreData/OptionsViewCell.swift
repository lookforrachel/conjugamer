//
//  OptionsViewCell.swift
//  jsonToCoreData
//
//  Created by Rachel Yee on 9/13/17.
//  Copyright © 2017 Lookforrachel. All rights reserved.
//

import Foundation
import UIKit

class optionsViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!
    var delegate:cellSwitchDelegate?
    
    @IBAction func cellSwitchAction(_ sender: UISwitch) {
        delegate?.switchUpdated(self)
    }
}
