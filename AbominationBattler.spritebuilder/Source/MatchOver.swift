//
//  MatchOver.swift
//  AbominationBattler
//
//  Created by Carol on 7/31/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//



class MatchOver: CCNode {
    
    weak var winnerNameText: CCLabelTTF?
    weak var win: CCLabelTTF?
    weak var forfeit: CCLabelTTF?
    
    weak var fightButton: CCButton?
    weak var habitatButton: CCButton?
    
    
    
    func toHabitat(){
        let toHabitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(toHabitat)
    }
    
    func toThunderdome(){
        let toThunderdome = CCBReader.loadAsScene("Thunderdome")
        CCDirector.sharedDirector().presentScene(toThunderdome)
    }

    
   
}
