
import UIKit

@IBDesignable class CardButton: UIButton {
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
    
    var disable: Bool {
        get{
            return !isEnabled
        }
        set{
            if newValue {
            isEnabled = false
            borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        } else {
            isEnabled = true
            borderColor = DefaultValues.borderColor
            }
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
        static let borderColor: UIColor = #colorLiteral(red: 0.9970558286, green: 0.8532791734, blue: 0.5802773833, alpha: 1)
        static let borderWidth: CGFloat = 4.0
        static let cornerRadius: CGFloat = 9.0
    }
    
}
