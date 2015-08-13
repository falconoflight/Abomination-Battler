//
//  Stats.swift
//  AbominationBattler
//
//  Created by Laura Bennett on 8/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class Stats: CCNode  {
    weak var win: CCLabelTTF?
    weak var loss: CCLabelTTF?
    weak var healthStat: CCLabelTTF?
    weak var staminaStat: CCLabelTTF?

    weak var attack1: CCLabelTTF?
    weak var attack: CCLabelTTF?
    weak var xp: CCLabelTTF?

    weak var closeButton: CCButton?
    
    var userState = UserState()
    
//  insert all the stats here
    override func onEnter() {
        // read from monster start plist
        let monsterType = userState.monsterType

        if let path = NSBundle.mainBundle().pathForResource("MonsterStart", ofType: "plist"){
            let src = NSDictionary(contentsOfFile: path)
            let monsterInfo = src?[monsterType]  as! NSDictionary
            let startHP = monsterInfo["startHP"] as! Int
            let startStamina = monsterInfo["startStamina"] as! Int
            
            healthStat?.string = "\(startHP)"
            staminaStat?.string = "\(startStamina)"
        }
        
        if let path = NSBundle.mainBundle().pathForResource("MonsterMoves", ofType: "plist"){
            let src = NSDictionary(contentsOfFile: path)
            let monsterMoves = src?[monsterType] as! NSDictionary
            var abilities = [Ability]()
            for move in monsterMoves.allKeys{
                
                let dict = monsterMoves.objectForKey(move) as! NSDictionary
                
                var cost = dict["cost"]!.integerValue as Int
                var dmg = dict["dmg"]!.integerValue as Int
                let ability = Ability( cost: cost, dmg: dmg, name: move as! String)
                abilities.append(ability)
                
                
            }
            attack?.string = "\(abilities[0].name): \ncost: \(abilities[0].cost) \ndamage: \(abilities[0].dmg)"
            attack1?.string = "\(abilities[1].name):  \ncost: \(abilities[1].cost) \ndamage: \(abilities[1].dmg)"
        }
        
        win?.string = "\(userState.monsterWin)"
        loss?.string = "\(userState.monsterLose)"
    }

    func close(){
        let toHabitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(toHabitat)
    }
}