//
//  Kimara.swift
//  RPGOOP
//
//  Created by Yogesh Kumar on 10/02/16.
//  Copyright © 2016 itsyogesh. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUN_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if(attackPwr >= IMMUN_MAX){
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
    
    
}
