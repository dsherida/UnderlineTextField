import UIKit

class UnderlineTextField: UITextField {

    let UNDERLINE_THICKNESS: CGFloat = 1.0
    let INDENT_SIZE: CGFloat = 10

    var underline: CALayer!
}

// MARK: - Lifecycle

extension CSTextField {

    override func awakeFromNib() {
        super.awakeFromNib()

        applyIndent()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if underline != nil {
            underline.removeFromSuperlayer()
        }

        applyUnderline()
    }

    func applyUnderline() {
        underline = CALayer()
        let width = CGFloat(UNDERLINE_THICKNESS)

        underline.borderColor = UIColor.blackColor().CGColor
        underline.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: frame.size.height)
        underline.borderWidth = width

        layer.addSublayer(underline)
        layer.masksToBounds = true
    }

    func applyIndent() {
        let paddingView = UIView(frame: CGRectMake(0, 0, INDENT_SIZE, frame.height))
        leftView = paddingView
        leftViewMode = UITextFieldViewMode.Always
    }

    override func prepareForInterfaceBuilder() {
        applyIndent()
    }
}
