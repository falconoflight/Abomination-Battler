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
    
    //win = userState.monsterWin


    func close(){
        let toHabitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(toHabitat)
    }
}