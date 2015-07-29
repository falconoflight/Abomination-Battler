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
    
    weak var normalAttackButton: CCButton!
    weak var specialAttackButton: CCButton!
    
    
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
        
        myMonster.currentHP = myMonster.maxHP
        myMonster.currentStamina = myMonster.maxStamina
        enemyMonster.currentHP = enemyMonster.maxHP
        enemyMonster.currentStamina = enemyMonster.maxStamina
        
        normalAttackButton.title = myMonster.moveList[0].name
        specialAttackButton.title = myMonster.moveList[2].name
        
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
            let ability = enemyMonster.chooseRandomAbility()
            applyAbility(ability, fromMonster: enemyMonster, toMonster: myMonster)
            isPlayerTurn = !isPlayerTurn
            
        
            
        }
    }
    
    func applyAbility(ability: Ability, fromMonster: Monster, toMonster: Monster) {
            fromMonster.currentStamina -= ability.cost
            let staminaRatio = Float(fromMonster.currentStamina)/Float(fromMonster.maxStamina)
        let staminaAction = CCActionScaleTo(duration: 0.2, scaleX: staminaRatio, scaleY: 1.0)
        
        
            toMonster.currentHP -= ability.dmg
        let healthRatio = Float(toMonster.currentHP)/Float(toMonster.maxHP)
        let hurtAction = CCActionScaleTo(duration: 0.2, scaleX: healthRatio, scaleY: 1.0)
        
        if isPlayerTurn {
            myStamina.runAction(staminaAction)
            enemyHealth.runAction(hurtAction)
        }
        else {
            enemyStamina.runAction(staminaAction)
            myHealth.runAction(hurtAction)
        }
        println("\(fromMonster.monsterType) used \(ability.name) on \(toMonster.monsterType)")
    }
    
    func toAttack(){
        animationManager.runAnimationsForSequenceNamed("ShowMenu")

    }
    //not sure how this is working if it is
    func attackSelected(button: CCButton){
        var currentAttack: Ability = myMonster.moveList[1]
        
        for ability in myMonster.moveList {
            if ability.name == button.title {
                currentAttack = ability
                }
        }
        println(button.title)
        animationManager.runAnimationsForSequenceNamed("HideMenu")
        isPlayerTurn = false
        applyAbility(currentAttack, fromMonster: myMonster, toMonster: enemyMonster)
        
    }
    
//    func normalAttackSelected() {
//        
//        println("normal attack button pressed")
//        animationManager.runAnimationsForSequenceNamed("HideMenu")
//
//    }
//    
//    func specialAttackSelected() {
//        
//        println("special attack button pressed")
//        animationManager.runAnimationsForSequenceNamed("HideMenu")
//    }
    
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
