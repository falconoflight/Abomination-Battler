//
//  Untitled.swift
//  AbominationBattler
//
//  Created by Laura Bennett on 7/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//


class Untitled: CCNode {
    
    var monsterNaming: CCTextField!
    var viewMonster: CCNode!
    var stateObject = UserState()
    var monsterSprite: CCSprite!
    
    func didLoadFromCCB (){
        stateObject.didSummonMonster = true
        monsterSprite = CCBReader.load(stateObject.monsterType) as! CCSprite
        viewMonster.addChild(monsterSprite)
        
    }

    
    func ok() {
        
        
        
        var monsterName = monsterNaming.string
        
        stateObject.name = monsterName
        
        
        let habitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(habitat)
        

    }


}
