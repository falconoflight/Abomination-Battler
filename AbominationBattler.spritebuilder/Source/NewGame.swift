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
    var lastMonsterPicked: String!
    var stateObject = UserState()
    weak var nameType: CCLabelTTF!
    
    func untitled() {
       
        stateObject.monsterType = lastMonsterPicked
        
        let untitled = CCBReader.loadAsScene("Untitled")
       CCDirector.sharedDirector().presentScene(untitled)
    }

// makes all the monster choosing buttons one selector with the argument CCButton  
    func previewMonster(button: CCButton) {
        println("I see my \(button.name) monster!")
        
        if let path = NSBundle.mainBundle().pathForResource("MonsterStart", ofType: "plist"){
            let src = NSDictionary(contentsOfFile: path)
            let monsterInfo = src?[button.name]  as! NSDictionary
            let startHP = monsterInfo["startHP"] as! Int
            let startStamina = monsterInfo["startStamina"] as! Int
            nameType.string = button.name
            menuStatBlock.string = "Health: \(startHP)" + " " + "Stamina: \(startStamina)"
            lastMonsterPicked = button.name
        }
    }
    
//  func monsterStart() {
//    if let path = NSBundle.mainBundle().pathForResource("MonsterStart", ofType: "plist"){
//        let src = NSDictionary(contentsOfFile: path)
//        let dict = src?[]  as! NSDictionary
//    
//    }
}
