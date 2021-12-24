
import Foundation

struct SetGame {
    
    private var deck = SetCardDeck()
    var deckCount: Int {return deck.cards.count}
    
    private(set) var flipCount = 0
    private(set) var score = 0
    private(set) var numberSets = 0
    
    private(set) var cardsOnTable = [Card]()
    private(set) var cardsSelected = [Card]()
    private(set) var cardsTryMatched = [Card]()
    private(set) var cardsRemoved = [Card]()
    
    
    var isSet: Bool? {
        get {
            guard cardsTryMatched.count == 3 else {return nil}
            return Card.isSet(cards: cardsTryMatched)
        }
        set {
            if newValue != nil {
                if newValue! {          //cards matchs
                    score += Points.matchBonus
                    numberSets += 1
                } else {               //cards didn't match - Penalize
                    score -= Points.missMatchPenalty
                }
                cardsTryMatched = cardsSelected
                cardsSelected.removeAll()
            } else {
                cardsTryMatched.removeAll()
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
         assert(cardsOnTable.indices.contains(index),
                "SetGame.chooseCard(at: \(index)) : Choosen index out of range")
     
         let cardChoosen = cardsOnTable[index]
         if !cardsRemoved.contains(cardChoosen) && !cardsTryMatched.contains(cardChoosen){
             if  isSet != nil{
                if isSet! {
                    replaceOrRemove3Cards()
                }
                isSet = nil
             }
             if cardsSelected.count == 2, !cardsSelected.contains(cardChoosen){
                 cardsSelected += [cardChoosen]
                 isSet = Card.isSet(cards: cardsSelected)
             } else {
                 cardsSelected.inOut(element: cardChoosen)
             }
              flipCount += 1
              score -= Points.flipOverPenalty
         }
     }
    
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
    
        private mutating func replaceOrRemove3Cards() {
            if let take3Cards = take3FromDeck() {
                cardsOnTable.replace(elements: cardsTryMatched, with: take3Cards)
            } else {
                cardsOnTable.remove(elements: cardsTryMatched)
            }
            cardsRemoved += cardsTryMatched
            cardsTryMatched.removeAll()
        }
    
    // MARK: SetGame constants
    
    private struct Points {
        static let matchBonus = 20
        static let missMatchPenalty = 10
        static var maxTimePenalty = 10
        static var flipOverPenalty = 1
    }
    
    private struct Constants {
        static let startNumberCards = 12
    }

}

extension Array where Element: Equatable {
    
    mutating func inOut(element: Element){
        if let from = self.firstIndex(of:element)  {
             self.remove(at: from)
         } else {
             self.append(element)
         }
     }

    
    mutating func replace(elements: [Element], with new: [Element]) {
        guard elements.count == new.count else {return}
        for index in 0..<new.count {
            if let indexMathed = self.firstIndex(of: elements[index]) {
                self [indexMathed] = new[index]
            }
        }
    }
    
    mutating func remove(elements: [Element]) {
        self = self.filter {!elements.contains($0)}
    }
}
