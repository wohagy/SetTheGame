//
//  ViewController.swift
//  SetTheGame
//
//  Created by Macbook on 02.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }

    @IBOutlet var cards: [CardButton]!
    
    private func updateViewFromModel() {
        for index in cards.indices{
            if index < 12 {
                cards[index].setTitle(String(index), for: UIControl.State.normal)
        }
    }
}
}

