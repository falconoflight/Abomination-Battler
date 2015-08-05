//
//  UserState.swift
//  AbominationBattler
//
//  Created by Laura Bennett on 7/22/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

class UserState: NSUserDefaults {
        var name: String = NSUserDefaults.standardUserDefaults().stringForKey("monsterName") ?? "Monster" {
            didSet {
                NSUserDefaults.standardUserDefaults().setObject(name, forKey:"monsterName")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    
    var monsterType: String = NSUserDefaults.standardUserDefaults().stringForKey("monster") ?? "Monster?" {
        didSet {
            NSUserDefaults.standardUserDefaults().setObject(monsterType, forKey: "monster")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var didSummonMonster: Bool = NSUserDefaults.standardUserDefaults().boolForKey("didSummonMonster") ?? false {
        didSet{
            NSUserDefaults.standardUserDefaults().setBool(didSummonMonster, forKey: "didSummonMonster")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var notHungry: Float = NSUserDefaults.standardUserDefaults().floatForKey("hungerHurts") ?? 1000 {
        didSet{
            NSUserDefaults.standardUserDefaults().setFloat(notHungry, forKey: "hungerHurts")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var happyMonster: Float = NSUserDefaults.standardUserDefaults().floatForKey("bloodthirsty") ?? 1000 {
        didSet{
            NSUserDefaults.standardUserDefaults().setFloat(happyMonster, forKey: "bloodthirsty")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var monsterWin: Int = NSUserDefaults.standardUserDefaults().integerForKey("win") ?? 0 {
        didSet{
           NSUserDefaults.standardUserDefaults().setInteger(monsterWin, forKey: "win")
           NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var monsterLose: Int = NSUserDefaults.standardUserDefaults().integerForKey("loss") ?? 0 {
        didSet{
            NSUserDefaults.standardUserDefaults().setInteger(monsterLose, forKey: "loss")
            NSUserDefaults.standardUserDefaults().synchronize()

        }
    }

//    
//        var highScore: Int = NSUserDefaults.standardUserDefaults().integerForKey("myHighScore") ?? 0 {
//            didSet {
//                NSUserDefaults.standardUserDefaults().setInteger(highScore, forKey:"myHighScore")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//        }
    }

