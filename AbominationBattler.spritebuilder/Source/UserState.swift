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

    
      //  var highScore: Int = NSUserDefaults.standardUserDefaults().integerForKey("myHighScore") ?? 0 {
       //     didSet {
         //       NSUserDefaults.standardUserDefaults().setInteger(highScore, forKey:"myHighScore")
           //     NSUserDefaults.standardUserDefaults().synchronize()
            //}
       // }
    }

