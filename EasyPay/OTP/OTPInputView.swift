//
//  OTPInputView.swift
//  EasyPay
//
//  Created by maxbazh on 4/14/26.
//

import UIKit

class OTPInputView : UIView {
    
    var text: String? {
        get { return label.text }
        set { label.text = newValue }
    }
    
    var isActive: Bool = false {
        didSet {
            updateBorderState()
        }
    }
    
    var label = UILabel()
    var borderView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OTPInputView {
    
    func style() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.backgroundColor = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark: return UIColor.darkOPTCode
            default:
                return UIColor.lightOPTCode
            }
        }
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = if isActive { UIColor.systemBlue.cgColor } else { UIColor.clear.cgColor }
        
    }
    
    func layout() {
        addSubview(borderView)
        
        NSLayoutConstraint.activate([
            borderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            borderView.topAnchor.constraint(equalTo: self.topAnchor),
            borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        borderView.layer.cornerRadius = bounds.height * 0.15
    }
    
    func updateBorderState() {
        borderView.layer.borderColor = isActive ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
    }
}
