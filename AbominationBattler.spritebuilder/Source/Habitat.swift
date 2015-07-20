//
//  Habitat.swift
//  ObjectAL
//
//  Created by Laura Bennett on 7/18/15.
//  Copyright (c) 2015 Karl Stenerud. All rights reserved.
//

//import Cocoa

class Habitat: CCNode {
    
    func toArena() {
        let toArena = CCBReader.loadAsScene("BattleArena")
        CCDirector.sharedDirector().presentScene(toArena)
    }
    
    //func happyUp() {
     //   let habitat = CCBReader.loadAsScene("Habitat")
     //   CCDirector.sharedDirector().presentScene(habitat)
    //}
    
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
