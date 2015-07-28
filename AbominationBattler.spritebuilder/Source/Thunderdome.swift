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
    
    weak var myMonsterNode: CCNode!
    weak var enemyMonsterNode: CCNode!
    
    weak var myMonsterTag: CCLabelTTF!
    weak var enemyMonsterTag: CCLabelTTF!
    
    
    //all the variables for turn based shit
    var isPlayerTurn: Bool = false
    var playerMonsterAbilities: [AnyObject]!
    var enemyMonsterAbilites: [AnyObject]!
    
    var gameState = UserState()
    var myMonster: Monster!
    var enemyMonster: Monster!
    
    
    
    override func onEnter() {
        super.onEnter()
        if let path = NSBundle.mainBundle().pathForResource("MonsterMoves", ofType: "plist"){
            let src = NSDictionary(contentsOfFile: path)
        }
    }
    
    
    func forfeit() {
        let habitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(habitat)
    }

}
