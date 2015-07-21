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
    
    var timeLeft: Float = 1000 {
        didSet {
            timeLeft = max(min(timeLeft, 1000), 0)
            hungerBar.scaleX = timeLeft / Float(1000)
        }
    }
    
    var boredom: Float = 1000 {
        didSet {
            boredom = max(min(boredom, 1000),0)
            happyBar.scaleX = timeLeft / Float(1000)
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
        timeLeft = 1000
    }

    
    func toArena() {
        let toArena = CCBReader.loadAsScene("BattleArena")
        CCDirector.sharedDirector().presentScene(toArena)
    }
    
    func happyUp() {
        boredom = 1000
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
