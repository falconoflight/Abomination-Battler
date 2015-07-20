//
//  NewGame.swift
//  AbominationBattler
//
//  Created by Laura Bennett on 7/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

//import Cocoa

class NewGame: CCNode {
    
    weak var menuStatBlock : CCLabelTTF!
    
    
    func untitled() {
       let untitled = CCBReader.loadAsScene("Untitled")
       CCDirector.sharedDirector().presentScene(untitled)
    }


}
