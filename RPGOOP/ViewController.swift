//
//  ViewController.swift
//  RPGOOP
//
//  Created by Yogesh Kumar on 10/02/16.
//  Copyright © 2016 itsyogesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var playerHpLabel: UILabel!
    @IBOutlet weak var enemyHpLabel: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var chestImage: UIImageView!
    let tapRec = UIGestureRecognizer()
    
    var player:Player!
    var enemy:Enemy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chestImage.userInteractionEnabled = true
        
        tapRec.addTarget(self, action: "onChestTapped")
        chestImage.addGestureRecognizer(tapRec)
        
        player = Player(name: "itsyogesh", hp: 110, attackingPwr: 20)
        
    }
    
    func onChestTapped() {
        
    }
    
}

