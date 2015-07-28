//
//  Monster.swift
//  AbominationBattler
//
//  Created by Monster on 7/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

struct Ability {
}

class Monster {
    
    
    var maxHP: Int = 0
    var currentHP: Int = 0
    var maxStamina: Int = 0
    var currentStamina: Int = 0
    
    var moveList: Dictionary < String, Ability > = Dictionary <String, Ability>()
    
    
    var level: Int = 1
    var currentXP: Int = 0
    var xpToLevel: Int = 0
    var totalXP: Int = 0
    
    
    
}