//
//  SetCardDeck.swift
//  SetTheGame
//
//  Created by Macbook on 16.12.2021.
//

import Foundation

struct SetCardDeck {
    private(set) var cards = [Card]()
    
    
    mutating func draw() -> Card? {
        if cards.count > 0 {
            return cards.remove(at: Int.random(in: 0..<cards.count))
        } else {
            return nil
        }
    }
        
}

//extension Int {
//    var arc4random: Int {
//        if self > 0 {
//            return Int(arc4random_uniform(UInt32(self)))
//        } else if self < 0 {
//            return Int(arc4random_uniform(UInt32(abs(self))))
//        } else {
//            return 0
//        }
//    }
//}
