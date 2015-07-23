//
//  Untitled.swift
//  AbominationBattler
//
//  Created by Laura Bennett on 7/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//


class Untitled: CCNode {
    
    var monsterNaming: CCTextField!
    
    func ok() {
        
        var stateObject = UserState()
        
        var monsterName = monsterNaming.string
        
        stateObject.name = monsterName
        
        let habitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(habitat)

    }


}
