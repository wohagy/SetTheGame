
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
    
    init() {
        for number in Card.Variant.allCases {
            for color in Card.Variant.allCases {
                for shape in Card.Variant.allCases {
                    for fill in Card.Variant.allCases {
                        cards.append(Card(number: number,
                                              color: color,
                                              shape: shape,
                                               fill: fill))
                    }
                }
            }
        }
    }
}
