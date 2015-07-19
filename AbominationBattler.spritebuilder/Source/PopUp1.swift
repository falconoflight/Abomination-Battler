
//pop ups that have items and things?
class PopUp1: CCNode {
        
        var nextLevelName = "Level1"
        
        func loadNextLevel() {
            let restartScene = CCBReader.loadAsScene(nextLevelName)
            let transition = CCTransition(fadeWithDuration: 0.8)
            CCDirector.sharedDirector().presentScene(restartScene, withTransition: transition)
        }
        
    }
