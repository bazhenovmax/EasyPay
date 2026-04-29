//
//  LoginView.swift
//  EasyPay
//
//  Created by maxbazh on 4/5/26.
//

import Foundation
import UIKit

class LoginView : UIView {
    let greetings = UILabel()
    let descriptionLabel = UILabel()
    let emailField = UITextField()
    let passwordField = UITextField()
    let stackView = UIStackView()
    let paddingEmailView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
    let paddingPasswordViewLeft = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
    let checkbox = UIButton()
    let rememberMe = UILabel()
    let horizontalStack = UIStackView()
    
    let passwordToggleButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    func style() {
        greetings.translatesAutoresizingMaskIntoConstraints = false
        greetings.text = "Welcome"
        greetings.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Please enter your email & password to sign in"
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        descriptionLabel.numberOfLines = 2
        
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.placeholder = "Email address"
        emailField.backgroundColor = UIColor(named: "TextFieldColor")
        emailField.layer.cornerRadius = 16
        emailField.clipsToBounds = true
        emailField.leftView = paddingEmailView
        emailField.leftViewMode = .always
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.placeholder = "Password"
        passwordField.backgroundColor = UIColor(named: "TextFieldColor")
        passwordField.layer.cornerRadius = 16
        passwordField.clipsToBounds = true
        passwordField.leftView = paddingPasswordViewLeft
        passwordField.leftViewMode = .always
        passwordField.enablePasswordToggle(buttonIcon: passwordToggleButton)
        passwordField.isSecureTextEntry = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.setImage(UIImage(systemName: "square"), for: .normal)
        checkbox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        checkbox.tintColor = .checkbox
        checkbox.addTarget(self, action: #selector(toggleCheckbox), for: .touchUpInside)
        checkbox.configuration?.buttonSize = .large
        checkbox.configuration = .borderless()
        
        rememberMe.translatesAutoresizingMaskIntoConstraints = false
        rememberMe.text = "Remember me"
        rememberMe.font = UIFont.preferredFont(forTextStyle: .body)
        
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 2
    }
    
    func layout() {
        horizontalStack.addArrangedSubview(checkbox)
        horizontalStack.addArrangedSubview(rememberMe)
        
        stackView.addArrangedSubview(greetings)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordField)
        stackView.addArrangedSubview(horizontalStack)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            emailField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 60),
            
            passwordField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 60),
    
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension LoginView {
    @objc func toggleCheckbox() {
        checkbox.isSelected.toggle()
    }
}
