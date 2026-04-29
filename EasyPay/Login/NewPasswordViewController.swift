//
//  NewPasswordViewController.swift
//  EasyPay
//
//  Created by maxbazh on 4/29/26.
//

import UIKit

class NewPasswordViewController : UIViewController {
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let newPassword = UITextField()
    let confirmNewPassword = UITextField()
    let stack = UIStackView()
    let paddingNewPasswordView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
    let paddingConfirmNewPassword = UIView(frame: CGRect(x: 0, y: 0 , width: 25, height: 20))
    let continueButton = UIButton()
    
    let passwordNewPasswordToggleButton = UIButton(type: .custom)
    let passwordConfirmedNewPasswordToggleButton = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}

extension NewPasswordViewController {
    func style() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Create new password"
        titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Your password should be difficult and not known to other people."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        
        newPassword.translatesAutoresizingMaskIntoConstraints = false
        newPassword.placeholder = "New Password"
        newPassword.layer.cornerRadius = 16
        newPassword.backgroundColor = UIColor(named: "TextFieldColor")
        newPassword.leftView = paddingNewPasswordView
        newPassword.leftViewMode = .always
        newPassword.clipsToBounds = true
        newPassword.enablePasswordToggle(buttonIcon: passwordNewPasswordToggleButton)
        newPassword.isSecureTextEntry = true
        
        confirmNewPassword.translatesAutoresizingMaskIntoConstraints = false
        confirmNewPassword.placeholder = "Confirm new password"
        confirmNewPassword.layer.cornerRadius = 16
        confirmNewPassword.backgroundColor = UIColor(named: "TextFieldColor")
        confirmNewPassword.leftView = paddingConfirmNewPassword
        confirmNewPassword.leftViewMode = .always
        confirmNewPassword.clipsToBounds = true
        confirmNewPassword.enablePasswordToggle(buttonIcon: passwordConfirmedNewPasswordToggleButton)
        confirmNewPassword.isSecureTextEntry = true
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Continue", for: [])
        continueButton.backgroundColor = .button
        continueButton.layer.cornerRadius = 28
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        continueButton.layer.shadowColor = UIColor.shadowButton.cgColor
        continueButton.layer.shadowOpacity = 1
        continueButton.layer.shadowOffset = CGSize(width: 4, height: 6.0)
        continueButton.layer.shadowRadius = 0
    }
    
    func layout() {
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        stack.addArrangedSubview(newPassword)
        stack.addArrangedSubview(confirmNewPassword)
        view.addSubview(stack)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionLabel.trailingAnchor, multiplier: 2),
            
            newPassword.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            newPassword.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            newPassword.heightAnchor.constraint(equalToConstant: 60),
            
            confirmNewPassword.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            confirmNewPassword.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            confirmNewPassword.heightAnchor.constraint(equalToConstant: 60),
            
            continueButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: continueButton.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: continueButton.safeAreaLayoutGuide.bottomAnchor, multiplier: 6),
            continueButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
