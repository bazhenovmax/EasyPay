//
//  ForgotPasswordView.swift
//  EasyPay
//
//  Created by maxbazh on 4/7/26.
//

import Foundation
import UIKit

class ForgotPasswordView : UIView {
    let title = UILabel()
    let descriptionLabel = UILabel()
    let emailTextField = UITextField()
    let stackView = UIStackView()
    let paddingEmailField = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ForgotPasswordView {
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Reset password"
        title.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "To reset your password you will need the next clear OTP code and it will come to your email"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email Address"
        emailTextField.backgroundColor = UIColor(named: "TextFieldColor")
        emailTextField.layer.cornerRadius = 16
        emailTextField.clipsToBounds = true
        emailTextField.leftView = paddingEmailField
        emailTextField.leftViewMode = .always
    }
    
    func layout() {
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(emailTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            emailTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
