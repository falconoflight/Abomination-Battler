//
//  Untitled.swift
//  AbominationBattler
//
//  Created by Laura Bennett on 7/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//


class Untitled: CCNode {
    
    func ok() {
        let habitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(habitat)
    }


}
