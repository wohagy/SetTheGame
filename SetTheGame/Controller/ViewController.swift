
import UIKit

class ViewController: UIViewController {
    
    private var game = SetGame()
    
    var colors = [#colorLiteral(red: 1, green: 0.4163245823, blue: 0, alpha: 1), #colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1), #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)]
    var strokeWidths:[CGFloat] = [ -10, 10, -10]
    var alphas:[CGFloat] = [1.0, 0.60, 0.15]
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var deckCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [SetCardButton]!{
        didSet {
            for button in cardButtons{
                button.strokeWidths = strokeWidths
                button.colors = colors
                button.alphas = alphas
            }
        }
    }
    
    @IBOutlet weak var dealButton: CardButton!
    @IBOutlet weak var newGameButton: CardButton!
    @IBOutlet weak var hintButton: CardButton!
    
    @IBAction func touchCard(_ sender: SetCardButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card was not in cardButtons")
        }
    }
    
    
    private func updateViewFromModel() {
        updateButtonsFromModel()
        deckCountLabel.text = "Deck: \(game.deckCount )"
        scoreLabel.text = "Score: \(game.score) / \(game.numberSets)"
        dealButton.disable = (game.cardsOnTable.count) >= cardButtons.count || game.deckCount == 0
      
    }
    
    
    private func updateButtonsFromModel() {
        messageLabel.text = ""
        
        for index in cardButtons.indices {
            let button = cardButtons[index]
            if index < game.cardsOnTable.count {
                //--------------------------------
                let card = game.cardsOnTable[index]
                button.setCard = card
                //-----------Selected----------------------
                button.setBorderColor(color:
                                        game.cardsSelected.contains(card) ? Colors.selected : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0))
                //-----------TryMatched----------------------
                if let itIsSet = game.isSet {
                    if game.cardsTryMatched.contains(card) {
                        button.setBorderColor(color:
                                                itIsSet ? Colors.matched: Colors.misMatched)
                    }
                    messageLabel.text = itIsSet ? "СОВПАДЕНИЕ" :"НЕСОВПАДЕНИЕ"
                }
                //--------------------------------
            } else {
                button.setCard = nil
            }
        }
    }
    
    
    @IBAction func deal3(_ sender: CardButton) {
        if (game.cardsOnTable.count + 3) <= cardButtons.count {
            game.deal3()
            updateViewFromModel()
        }
    }
    
    
    @IBAction func newGame(_ sender: CardButton) {
        game = SetGame()
        cardButtons.forEach { $0.setCard = nil }
        updateViewFromModel()
    }
    
    //     MARK:    ViewController lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        updateViewFromModel()
    }
}

extension ViewController {
    //------------------ Constants -------------
    private struct Colors {
        static let hint = #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)
        static let selected = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        static let matched = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        static var misMatched = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private struct Constants {
        static let flashTime = 1.5
    }
}

extension Int {
    func incrementCicle (in number: Int)-> Int {
        return (number - 1) > self ? self + 1: 0
    }
}
