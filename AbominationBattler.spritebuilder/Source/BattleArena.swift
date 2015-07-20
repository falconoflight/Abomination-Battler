//
//  BattleArena.swift
//  AbominationBattler
//
//  Created by Laura Bennett on 7/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//



class BattleArena: CCNode {
    
    func Town() {
        let Town = CCBReader.loadAsScene("Town")
        CCDirector.sharedDirector().presentScene(Town)
    }


}
