//
//  Spots.swift
//  Park @ JMU
//
//  Created by David Faliskie on 3/19/15.
//  Copyright (c) 2015 David Faliskie. All rights reserved.
//

import Foundation

// hard coded data values
struct Spots {
    let NumSpaces = [
        "5", "7", "10", "30", "37", "24", "3", "16", "54", "32", "45", "65", "73", "77", "89", "95"
    ]
    
    func randomSpace() -> String{
        var unsignedArrayCount = UInt32(NumSpaces.count)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        
        return NumSpaces[randomNumber]
        
    }
    
}

// unwrapped JSON object
struct Current {
    var lot_name: String
    var campus_location: String
    var capacity: String
    var available: String
    var backup_lot: String
    
    init(lotDictionary: NSDictionary) {
        let currentLotName: NSArray = lotDictionary["LotResults"] as! NSArray
        
        let LotName: NSDictionary = currentLotName[0] as! NSDictionary
        
        lot_name = LotName["lot_name"] as! String
        campus_location = LotName["campus_location"] as! String
        capacity = LotName["capacity"] as! String
        available = LotName["available"] as! String
        backup_lot = LotName["backup_lot"] as! String
    }
    
}

struct GetLotNames {
    
    
}




