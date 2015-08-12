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
    weak var defend: CCButton!
    weak var matchOverScreen: CCNode!
    weak var commandLine: CCLabelTTF!
    
    
    //all the variables for turn based shit
    var isPlayerTurn: Bool = false
    var isEnemyComputer: Bool = true
    var isGameStart: Bool = false
    var gameState = UserState()
    var myMonster: Monster!
    var enemyMonster: Monster!
    var matchOver: Bool = false
    
    
    override func onEnter() {
        super.onEnter()
        myMonster = Monster.generateMonsterFromType(gameState.monsterType)
        let mySprite = CCBReader.load(myMonster.monsterType)
        myMonsterNode.addChild(mySprite)
        println(myMonster.maxHP)
        
        prepareEnemy()
        
        myMonsterTag.string = gameState.name
//        enemyMonsterTag
        
        myMonster.currentHP = myMonster.maxHP
        myMonster.currentStamina = myMonster.maxStamina
        enemyMonster.currentHP = enemyMonster.maxHP
        enemyMonster.currentStamina = enemyMonster.maxStamina
        
        normalAttackButton.title = myMonster.moveList[0].name
        specialAttackButton.title = myMonster.moveList[1].name
//        
//        scheduleBlock({ (timer) -> Void in
//            self.animationManager.runAnimationsForSequenceNamed("ShowMenu")
//        }, delay: 2.0)
        
        //choose first move
        let coin = CCRANDOM_0_1()
        if coin > 0.5 {
            isPlayerTurn = false
        } else {
            isPlayerTurn = true
        }
        
        let tag = isPlayerTurn ? myMonsterTag.string : enemyMonsterTag.string
        
        commandLine.string = "It is \(tag)'s move first!"
        
        scheduleOnce(Selector("startGame"), delay: 1.0)
    }
    
    func startGame() {
        isGameStart = true
    }
    
    func forfeit() {
        let habitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(habitat)
    }

    
    override func update(delta: CCTime) { //add check to for who has first turn and print it in the command line
        
        if !isPlayerTurn && isEnemyComputer && enemyMonster.currentHP > 0 && isGameStart {
            //computer player chooses move here
            let ability = enemyMonster.chooseRandomAbility()
            
            if ability.cost < enemyMonster.currentStamina {
                applyAbility(ability, fromMonster: enemyMonster, toMonster: myMonster)
            } else {
                commandLine.string = "\(enemyMonsterTag.string) is too tired to fight!"
                println("\(enemyMonsterTag.string) is too tired to fight!")
            }
            isPlayerTurn = !isPlayerTurn
            
        }
    }

    
    func applyAbility(ability: Ability, fromMonster: Monster, toMonster: Monster) {
        fromMonster.currentStamina -= ability.cost
        let staminaRatio = Float(fromMonster.currentStamina)/Float(fromMonster.maxStamina)
        let staminaAction = CCActionScaleTo(duration: 0.2, scaleX: staminaRatio, scaleY: 1.0)
        
        let fromTag = isPlayerTurn ? myMonsterTag.string : enemyMonsterTag.string
        let toTag = isPlayerTurn ? enemyMonsterTag.string : myMonsterTag.string
        
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
        println("\(fromTag) used \(ability.name) on \(toTag)")
        commandLine.string = "\(fromTag) used \(ability.name) on \(toTag)"
        if toMonster.currentHP == 0  {
            println("\(toTag) has fainted!")
            commandLine.string = "\(toTag) has fainted!"
            triggerMatchOver()
        }
    }
    
    
    func toAttack(){
        animationManager.runAnimationsForSequenceNamed("ShowMenu")

    }
    //not sure how this is working if it is- buttons
    func attackSelected(button: CCButton){
        var currentAttack: Ability = myMonster.moveList[1]
        
        for ability in myMonster.moveList {
            if ability.name == button.title {
                currentAttack = ability
                }
        }
        println(button.title)
        animationManager.runAnimationsForSequenceNamed("HideMenu")
        //isPlayerTurn = false
        applyAbility(currentAttack, fromMonster: myMonster, toMonster: enemyMonster)
        scheduleOnce(Selector("toggleTurn"), delay: 2.0)
    }
    
    func toggleTurn() {
        isPlayerTurn = !isPlayerTurn
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
    
    
    func toDefend() {
        let heal = Ability(cost: 8, dmg: -30, name: "Heal")
//        applyAbility(heal, fromMonster: myMonster, toMonster: myMonster)
        myMonster.currentStamina -= heal.cost
        let staminaRatio = Float(myMonster.currentStamina)/Float(myMonster.maxStamina)
        let staminaAction = CCActionScaleTo(duration: 0.2, scaleX: staminaRatio, scaleY: 1.0)
        
        myMonster.currentHP -= heal.dmg
        let healthRatio = Float(myMonster.currentHP)/Float(myMonster.maxHP)
        let hurtAction = CCActionScaleTo(duration: 0.2, scaleX: healthRatio, scaleY: 1.0)
        
        myStamina.runAction(staminaAction)
        myHealth.runAction(hurtAction)

        toggleTurn()
        
        println("\(myMonster.monsterType) used \(heal.name) on \(myMonster.monsterType)")
        commandLine.string = "\(myMonster.monsterType) used \(heal.name) on \(myMonster.monsterType)"
    }
    
    
    
    
    func triggerMatchOver() {
        matchOver = true
        var victorString = ""
        if isPlayerTurn {
            victorString = myMonsterTag.string
            gameState.monsterWin++
        }
        else {
            victorString = enemyMonsterTag.string
            gameState.monsterLose++
        }
//        restartButton.visible = true

        var matchOverScreen = CCBReader.load("MatchOver", owner: self) as! MatchOver
        matchOverScreen.winnerNameText!.string = victorString
        self.addChild(matchOverScreen)
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
            enemyMonsterTag.string = type

            println(type)
        }
    }
}
