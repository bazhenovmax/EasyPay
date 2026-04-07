//
//  LoginViewController.swift
//  EasyPay
//
//  Created by maxbazh on 4/5/26.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    let loginView = LoginView()
    let forgotPassword = UIButton()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        forgotPassword.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        forgotPassword.setTitleColor(.systemBlue, for: .normal)
        forgotPassword.titleLabel?.textAlignment = .center
        forgotPassword.setTitle("Forgot Password?", for: .normal)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Sign in", for: [])
        loginButton.backgroundColor = .button
        loginButton.layer.cornerRadius = 28
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        loginButton.addTarget(self, action: #selector(tappedButton), for: .primaryActionTriggered)
        loginButton.layer.shadowColor = UIColor.shadowButton.cgColor
        loginButton.layer.shadowOpacity = 1
        loginButton.layer.shadowOffset = CGSize(width: 4, height: 6.0)
        loginButton.layer.shadowRadius = 0
        
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(forgotPassword)
        view.addSubview(loginButton)
        

        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
            
            forgotPassword.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
            forgotPassword.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 0),
            forgotPassword.bottomAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 8),
            
            loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
    
}

extension LoginViewController {
    @objc func tappedButton() {
        print("Logged in")
    }
}
