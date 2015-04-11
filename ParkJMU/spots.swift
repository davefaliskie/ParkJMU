//
//  Spots.swift
//  Park @ JMU
//
//  Created by David Faliskie on 3/19/15.
//  Copyright (c) 2015 David Faliskie. All rights reserved.
//

import Foundation

struct Spots {
    let NumSpaces = [
        "5", "10", "30", "37", "24", "3", "16", "54", "39", "45"
    ]
    
    func randomSpace() -> String{
        var unsignedArrayCount = UInt32(NumSpaces.count)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        
        return NumSpaces[randomNumber]
        
    }
}