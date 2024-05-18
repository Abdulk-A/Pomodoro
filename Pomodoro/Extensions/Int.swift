//
//  Int.swift
//  Pomodoro
//
//  Created by Abdullah Abdulkareem on 5/16/24.
//

import Foundation

extension Int {
    
    //minutes to seconds
    var minToSec: Int {
        self * 60
    }
    
    //formatting int to show time in minutes and seconds in this format mm:ss
    func formattedTime() -> String {
        let min = Int(self/60)
        let sec = Int(self - (min * 60))
        
        if (min <= 9 && min >= 0) && (sec <= 9 && sec >= 0) { return "0\(min):0\(sec)"}
        else if sec <= 9 && sec >= 0 { return "\(min):0\(sec)"}
        else if min <= 9 && min >= 0 { return "0\(min):\(sec)"}
        
        return "\(min):\(sec)"
    }
    
    static let BREAK_TIME = 300      //5 MINUTES
    static let STUDY_TIME = 1500     //25 MINUTES
    static let TEST_TIME_SHORT = 10  //10 SECONDS
    static let TEST_TIME_MEDIUM = 60 //1 MINUTE
    static let TEST_TIME_LONG = 120  //2 MINUTES
}
