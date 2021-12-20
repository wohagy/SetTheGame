
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }

    @IBOutlet var cards: [CardButton]!
    
    private func updateViewFromModel() {
        for index in cards.indices{
            let button = cards[index]
            button.setTitle(String(index), for: UIControl.State.normal)
            if index < 12 {
                button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
    }
}
}

