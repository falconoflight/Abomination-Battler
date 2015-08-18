//
//  Habitat.swift
//  ObjectAL
//
//  Created by Laura Bennett on 7/18/15.
//  Copyright (c) 2015 Karl Stenerud. All rights reserved.
//

import Mixpanel

class Habitat: CCNode {
    
    weak var hungerBar: CCSprite!
    weak var happyBar: CCSprite!
    weak var happyButton: CCButton!
    weak var feedButton: CCButton!
    weak var spawnPoint: CCNode!
    weak var nameTag: CCLabelTTF!
    weak var statButton: CCButton!
//    weak var mainbutton: CCButton!
    
    var monsterSprite: CCSprite!
    var userState = UserState()
    
    var meterTime: Float = 1000.0
    var mixpanel = Mixpanel.sharedInstance()
    
    var timeLeft: Float = 1000.0 {
        didSet {
            timeLeft = max(min(timeLeft, meterTime), 0)
            hungerBar.scaleX = timeLeft / Float(meterTime)
        }
    }
    
    var boredom: Float = 1000.0 {
        didSet {
            boredom = max(min(boredom, meterTime),0)
            happyBar.scaleX = boredom / Float(meterTime)
        }
    }
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        userState.didSummonMonster = true
        monsterSprite = CCBReader.load(userState.monsterType) as! CCSprite
        spawnPoint.addChild(monsterSprite)
        timeLeft = userState.notHungry
        boredom = userState.happyMonster
        nameTag.string = userState.name
    }
    
    override func update(delta: CCTime) {
        boredom -= Float(delta)
        
        timeLeft -= Float(delta)
//        if timeLeft == 0 {
//            //tamagachi dies
//            println("gameOver")
//        }
    }
    
    override func onExit() {
        userState.notHungry = timeLeft
        userState.happyMonster = boredom
    
        super.onExit()
    
    }
    
    func feed() {
        timeLeft = 1000
        mixpanel.track("Pet Care", properties: ["Action" : "Feed"])
    }

    
    func toThunderdome(){
        let toThunderdome = CCBReader.loadAsScene("Thunderdome")
        CCDirector.sharedDirector().presentScene(toThunderdome)
        mixpanel.track("Fight", properties: ["Arena": "Computer"])
    }
//    
//    // only for demo day
//    func toMain(){
//        let main = CCBReader.loadAsScene("MainScene")
//        CCDirector.sharedDirector().presentScene(main)
  
//    }
//
//    func toArena() {
//        let toArena = CCBReader.loadAsScene("BattleArena")
//        CCDirector.sharedDirector().presentScene(toArena)
//    }
    
    func happyUp() {
        boredom = 1000
        mixpanel.track("Pet Care", properties: ["Action": "Play"])
    }
    
    func stats() {
    var stat = CCBReader.load("Stats", owner: self) as! Stats
    self.addChild(stat)
    }
//
//    func items() {
//        let habitat = CCBReader.loadAsScene("Habitat")
//    
//    }
    
//    func Town() {
//        let Town = CCBReader.loadAsScene("Town")
//        CCDirector.sharedDirector().presentScene(Town)
//    }
//
}
