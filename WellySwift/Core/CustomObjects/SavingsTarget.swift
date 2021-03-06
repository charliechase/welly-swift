//
//  SavingsTarget.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

class SavingsTarget: NSObject {

    var goal:Int = 0
    var progress:Int = 0
    var title:String = ""
    
    var currentPercent:CGFloat  {
      
        get {
            
            if((progress > goal) || (goal < 0) || (progress <= 0)) {
                return 0
            }
            var currentPercent = CGFloat((CGFloat(progress)/CGFloat(goal)) * 100.0)
            
            return currentPercent
        }
    }
    
    init(title:String!, goal:Int!) {
        self.title = title
        self.goal = goal
        super.init()
    }

    func getProgressWidth(maxWidth: CGFloat) -> CGFloat {
        
        if (maxWidth <= 0) {
            return 0.0;
        }
                
        return getWidthPercentage(maxWidth, percent: currentPercent)
    }
    
    func formattedDisplayValue() -> String {
        
        return "$" + String(progress) + " of $" + String(goal);
    }
    
    private func getWidthPercentage(maxWidth:CGFloat, percent:CGFloat) -> CGFloat {

        if (currentPercent <= 0 || maxWidth <= 0) {
            return 0
        }
        
        var percentageFraction = maxWidth * (percent/100.0)
        
        return percentageFraction
    }
    
    // MARK: - Serialization
    
    // Used for NSUserDefaults
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.goal, forKey: "goal")
        aCoder.encodeObject(self.progress, forKey: "progress")
    }
    
    init(coder aDecoder: NSCoder!) {
        self.title = aDecoder.decodeObjectForKey("title") as String
        self.goal = aDecoder.decodeObjectForKey("goal") as Int
        self.progress = aDecoder.decodeObjectForKey("progress") as Int
    }
}
