import Foundation

class MainScene: CCNode {
    
//    weak var continueButton: CCButton!
//    weak var newGameButton: CCButton!
    weak var playButton: CCButton!
    
//    func play() {
//        let habitat = CCBReader.loadAsScene("Habitat")
//        CCDirector.sharedDirector().presentScene(habitat)
//    }
//    
//    func newGame() {
//        let newGame = CCBReader.loadAsScene("NewGame")
//        CCDirector.sharedDirector().presentScene(newGame)
//    
//    }

    
    override func onEnter() {
        super.onEnter()
        var userState = UserState()
        println(userState.name + " " + userState.monsterType + " \(userState.didSummonMonster)")
        
        if userState.didSummonMonster {
//            newGameButton.visible = false

            let habitat = CCBReader.loadAsScene("Habitat")
                CCDirector.sharedDirector().presentScene(habitat)


        }
//        not quite the effect I wanted below... but it works. you never see the title screen. and if it is uncommented the button doesn't go anywhere
        else {
//            continueButton.visible = false
//            func play() {
                let newGame = CCBReader.loadAsScene("NewGame")
                CCDirector.sharedDirector().presentScene(newGame)
                
//            }

        }
    }

}
