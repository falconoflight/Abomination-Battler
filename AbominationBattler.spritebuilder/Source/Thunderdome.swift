//
//  Thunderdome.swift
//  AbominationBattler
//
//  Created by Laura Bennett on 7/27/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//



class Thunderdome: CCNode {
    
    weak var enemyHealth: CCNodeColor!
    weak var enemyStamina: CCNodeColor!
    weak var myHealth: CCNodeColor!
    weak var myStamina: CCNodeColor!
    
    weak var myMonsterNode: CCNode!
    weak var enemyMonsterNode: CCNode!
    
    weak var myMonsterTag: CCLabelTTF!
    weak var enemyMonsterTag: CCLabelTTF!
    
    
    //all the variables for turn based shit
    var isPlayerTurn: Bool = false
    var isEnemyComputer: Bool = true
    var gameState = UserState()
    var myMonster: Monster!
    var enemyMonster: Monster!
    
    
    
    override func onEnter() {
        super.onEnter()
        myMonster = Monster.generateMonsterFromType(gameState.monsterType)
        let mySprite = CCBReader.load(myMonster.monsterType)
        myMonsterNode.addChild(mySprite)
        println(myMonster.maxHP)
        
        prepareEnemy()
        //scheduleBlock({ (timer) -> Void in
         //   self.animationManager.runAnimationsForSequenceNamed("ShowMenu")
        //}, delay: 2.0)
    }
    
    
    func forfeit() {
        let habitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(habitat)
    }

    
    override func update(delta: CCTime) {
        
        if !isPlayerTurn && isEnemyComputer{
            //computer player chooses move here
            
        }
    }
    
    func normalAttackSelected() {
        println("normal attack button pressed")
    }
    
    func specialAttackSelected() {
        println("special attack button pressed")
        animationManager.runAnimationsForSequenceNamed("HideMenu")
    }
    
    func prepareEnemy() {
        if isEnemyComputer {
            var type: String
            let rand = arc4random()%5
            switch rand {
            case 0:
                type = "Red"
            case 1:
                type = "Yellow"
            case 2:
                type = "Green"
            case 3:
                type = "Blue"
            default:
                type = "Purple"
            }
            let monster = Monster.generateMonsterFromType(type)
            let enemySprite = CCBReader.load(type)
            //enemyMonsterNode = enemySprite
            enemyMonster = monster
            enemyMonsterNode.addChild(enemySprite)
            println(type)
        }
    }
}
