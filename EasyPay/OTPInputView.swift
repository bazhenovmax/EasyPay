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
    
    var isActive: Bool? = false {
        didSet {
            updateBorderState()
        }
    }
    
    var onTextChange: ((String) -> Unit)?
    
    
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
        backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.backgroundColor = .clear
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor.clear.cgColor
    }
    
    func layout() {
        addSubview(borderView)
        borderView.addSubview(label)
        
        NSLayoutConstraint.activate([
            borderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            borderView.topAnchor.constraint(equalTo: self.topAnchor),
            borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: borderView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: borderView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: borderView.bottomAnchor),
            label.topAnchor.constraint(equalTo: borderView.topAnchor)
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        borderView.layer.cornerRadius = bounds.height * 0.15
    }
    
    func updateBorderState() {
        borderView.layer.borderColor = isActive! ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
    }
}
