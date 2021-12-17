//
//  SetGame.swift
//  SetTheGame
//
//  Created by Macbook on 16.12.2021.
//

import Foundation

struct SetGame {
    private(set) var cardsOnTable = [Card]()
    private(set) var cardsSelected = [Card]()
    private(set) var cardsTryMatched = [Card]()
    private(set) var cardsRemoved = [Card]()
    
    private var deck = SetCardDeck()
    var deckCount: Int {return deck.cards.count}
    
    private mutating func take3FromDeck() -> [Card]? {
        var threeCards = [Card]()
        for _ in 0...2 {
            if let card = deck.draw() {
                threeCards += [card]
            } else {
                return nil
            }
        }
        return threeCards
    }
    
    mutating func deal3() {
        if let cards = take3FromDeck() {
            cardsOnTable += cards
        }
    }
    
//    private mutating func replaceOrRemove3Cards() {
//        if let take3Cards = take3FromDeck() {
//            cardsOnTable.replaceSubrange(cardsTryMatched, with: take3Cards)
//        } else {
//            cardsOnTable.removeSubrange(cardsTryMatched)
//        }
//    }
}
