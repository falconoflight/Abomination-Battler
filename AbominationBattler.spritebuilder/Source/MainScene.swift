import Foundation

class MainScene: CCNode {
    
    weak var continueButton: CCButton!
    weak var newGameButton: CCButton!
    weak var playButton: CCButton!
    weak var creditsButton: CCButton!
    weak var backButton: CCButton!
    var creditsLayer: CCNode?
    
    func play() {
        let habitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(habitat)
    }
    
    func newGame() {
        let newGame = CCBReader.loadAsScene("NewGame")
        CCDirector.sharedDirector().presentScene(newGame)
    
    }

    func credits(){
        creditsLayer = CCBReader.load("Credit", owner: self)
        
        self.addChild(creditsLayer)
        
    }
    
    func back() {
        creditsLayer?.removeFromParent()
        println("test")
    }
    
    override func onEnter() {
        super.onEnter()
        var userState = UserState()
        println(userState.name + " " + userState.monsterType + " \(userState.didSummonMonster)")
        
        if userState.didSummonMonster {
            newGameButton.visible = false
        }
        else {
            continueButton.visible = false

        }
    }

}
