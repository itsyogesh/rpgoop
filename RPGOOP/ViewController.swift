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
    @IBOutlet weak var attackButton: UIButton!
    
    var player:Player!
    var enemy:Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRec = UITapGestureRecognizer(target: self, action: Selector("onChestTapped"))
        chestImage.addGestureRecognizer(tapRec)
        chestImage.userInteractionEnabled = true
        
        player = Player(name: "itsyogesh", hp: 110, attackingPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLabel.text = "\(player.hp) HP"
        enemyHpLabel.text = "\(enemy.hp) HP"
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackingPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 50, attackingPwr: 15)
        }
        
        if(enemyImage.hidden){
            enemyImage.hidden = false
            enemyHpLabel.text = "\(enemy.hp) HP"
        }
        
    }
    
    func onChestTapped() {
        chestImage.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func onAttackTapped(sender: AnyObject) {
        if(enemy.attemptAttack(player.attackPwr)){
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLabel.text = "\(enemy.hp) HP"
        }
        else {
            printLabel.text = "Attack was unsucessful"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestImage.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLabel.text = "0 HP"
            printLabel.text = "You killed the \(enemy.type)"
            enemyImage.hidden = true
        }
    }
}

