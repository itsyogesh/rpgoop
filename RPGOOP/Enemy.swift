//
//  Enemy.swift
//  RPGOOP
//
//  Created by Yogesh Kumar on 10/02/16.
//  Copyright © 2016 itsyogesh. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Rusty Dagger", "Cracked Butler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if(!isAlive) {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
    
}