//
//  CardButton.swift
//  SetTheGame
//
//  Created by Macbook on 03.12.2021.
//

import UIKit

class CardButton: UIButton {
    @IBInspectable var borderColor: UIColor = DefaultValues.borderColor {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
 
    }
    @IBInspectable var borderWidth: CGFloat = DefaultValues.borderWidth {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = DefaultValues.cornerRadius {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        clipsToBounds = true
    }
    
    private struct DefaultValues {
        static let borderColor: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        static let borderWidth: CGFloat = 4.0
        static let cornerRadius: CGFloat = 8.0
    }
    
}
