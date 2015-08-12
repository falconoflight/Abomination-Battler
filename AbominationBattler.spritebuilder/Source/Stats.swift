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
        if let path = NSBundle.mainBundle().pathForResource("MonsterStart", ofType: "plist"){
            let src = NSDictionary(contentsOfFile: path)
            let monsterType = userState.monsterType
            let monsterInfo = src?[monsterType]  as! NSDictionary
            let startHP = monsterInfo["startHP"] as! Int
            let startStamina = monsterInfo["startStamina"] as! Int
            
            healthStat?.string = "\(startHP)"
            staminaStat?.string = "\(startStamina)"
        }
        
        win?.string = "\(userState.monsterWin)"
        loss?.string = "\(userState.monsterLose)"
    }

    func close(){
        let toHabitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(toHabitat)
    }
}