//
//  Monster.swift
//  AbominationBattler
//
//  Created by Monster on 7/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

struct Ability {
    var cost: Int
    var dmg: Int
    var name: String
    
}

class Monster {
    
    
    var maxHP: Int = 0
    var currentHP: Int = 0 {
        didSet{
            currentHP = Int(clampf(Float(currentHP), 0, Float(maxHP)))
        }
    }
    
    var maxStamina: Int = 0
    var currentStamina: Int = 0 {
        didSet{
             currentStamina = Int(clampf(Float(currentStamina), 0, Float(maxStamina)))
        }
    }
    
    
    var moveList: [Ability] = []
    
    var monsterType: String = ""
    
    var level: Int = 1
    var currentXP: Int = 0
    var xpToLevel: Int = 0
    var totalXP: Int = 0
    
    class func generateMonsterFromType (type : String) -> Monster {
        
        var monster: Monster = Monster()
        
        if let path = NSBundle.mainBundle().pathForResource("MonsterStart", ofType: "plist"){
            let src = NSDictionary(contentsOfFile: path)
            let dict = src?[type]  as! NSDictionary
            monster.maxHP = dict["startHP"]!.integerValue as Int
            monster.maxStamina = dict["startStamina"]!.integerValue as Int
            monster.monsterType = type
            monster.loadMoves()
        }
        
        return monster

    }
    
    func loadMoves() {
        
        if let path = NSBundle.mainBundle().pathForResource("MonsterMoves", ofType: "plist"){
            let src = NSDictionary(contentsOfFile: path)
            let dict = src?[monsterType] as! NSDictionary
            for key: String in dict.allKeys as! [String] {
                let dmg: Int = dict[key]?.valueForKey("dmg") as? Int ?? 0
                let cost: Int = dict[key]?.valueForKey("cost") as? Int ?? 0
                let ability = Ability(cost: cost, dmg: dmg, name: key)
                moveList.append(ability)
                println(key)
            }
        }

    }
    
    
    func chooseRandomAbility() ->Ability {
        
        let rand = Int(arc4random_uniform(UInt32(moveList.count)))
        return moveList[rand]
    }
}