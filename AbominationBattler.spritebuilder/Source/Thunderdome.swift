//
//  Thunderdome.swift
//  AbominationBattler
//
//  Created by Laura Bennett on 7/27/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//



class Thunderdome: CCNode {
    
    weak var enemyHealth: CCNodeColor!
    weak var enemyStamina: CCNodeColor!
    weak var myHealth: CCNodeColor!
    weak var myStamina: CCNodeColor!
    
    weak var myMonster: CCNode!
    weak var enemyMonster: CCNode!
    
    weak var myMonsterTag: CCLabelTTF!
    weak var enemyMonsterTag: CCLabelTTF!
    
    
    func forfeit() {
        let habitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(habitat)
    }

}
