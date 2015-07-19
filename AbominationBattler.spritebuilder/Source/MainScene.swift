import Foundation

class MainScene: CCNode {
    
    func play() {
        let habitat = CCBReader.loadAsScene("Habitat")
        CCDirector.sharedDirector().presentScene(habitat)
    }
    
    func newGame() {
        let newGame = CCBReader.loadAsScene("NewGame")
        CCDirector.sharedDirector().presentScene(newGame)
    }


}
