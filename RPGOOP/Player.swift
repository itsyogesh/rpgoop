//
//  Player.swift
//  RPGOOP
//
//  Created by Yogesh Kumar on 10/02/16.
//  Copyright © 2016 itsyogesh. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackingPwr: Int) {
        self.init(startingHp: hp, attackingPwr: attackingPwr)
        _name = name;
    }
}