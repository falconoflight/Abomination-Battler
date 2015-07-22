//
//  Habitat.swift
//  ObjectAL
//
//  Created by Laura Bennett on 7/18/15.
//  Copyright (c) 2015 Karl Stenerud. All rights reserved.
//

//import Cocoa

class Habitat: CCNode {
    
    //weak var Character: CCSprite!
    
    weak var hungerBar: CCSprite!
    weak var happyBar: CCSprite!
    weak var happyButton: CCButton!
    weak var feedButton: CCButton!
    
    var meterTime: Float = 100
    
    
    var timeLeft: Float = 100 {
        didSet {
            timeLeft = max(min(timeLeft, meterTime), 0)
            hungerBar.scaleX = timeLeft / Float(meterTime)
        }
    }
    
    var boredom: Float = 100 {
        didSet {
            boredom = max(min(boredom, meterTime),0)
            happyBar.scaleX = boredom / Float(meterTime)
        }
    }
    
    func didLoadFromCCB() {
        
        userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        boredom -= Float(delta)
        
        timeLeft -= Float(delta)
        if timeLeft == 0 {
            //tamagachi dies
            println("gameOver")
        }
    }
    
    func feed() {
        timeLeft = 100
    }

    
    func toArena() {
        let toArena = CCBReader.loadAsScene("BattleArena")
        CCDirector.sharedDirector().presentScene(toArena)
    }
    
    func happyUp() {
        boredom = 100
    }
    
    //func stats() {
      //  let habitat = CCBReader.loadAsScene("Habitat")
      //  CCDirector.sharedDirector().presentScene(habitat)
   // }
    
    //func items() {
     //   let habitat = CCBReader.loadAsScene("Habitat")
      //  CCDirector.sharedDirector().presentScene(habitat)
    //}
    
    func Town() {
        let Town = CCBReader.loadAsScene("Town")
        CCDirector.sharedDirector().presentScene(Town)
    }

}
