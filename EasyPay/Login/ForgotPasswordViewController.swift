//
//  ForgotPasswordViewController.swift
//  EasyPay
//
//  Created by maxbazh on 4/7/26.
//

import Foundation
import UIKit

class ForgotPasswordViewController : UIViewController {
    let forgotPasswordView = ForgotPasswordView()
    let continueButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension ForgotPasswordViewController {
    
    func style() {
        forgotPasswordView.translatesAutoresizingMaskIntoConstraints = false
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Continue", for: [])
        continueButton.backgroundColor = UIColor.button
        continueButton.layer.cornerRadius = 28
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        continueButton.layer.shadowColor = UIColor.shadowButton.cgColor
        continueButton.layer.shadowOpacity = 1
        continueButton.layer.shadowOffset = CGSize(width: 4.0, height: 6.0)
        continueButton.layer.shadowRadius = 0
    }
    
    func layout() {
        view.addSubview(forgotPasswordView)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            forgotPasswordView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            forgotPasswordView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: forgotPasswordView.trailingAnchor, multiplier: 2),
            
            continueButton.leadingAnchor.constraint(equalTo: forgotPasswordView.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: forgotPasswordView.trailingAnchor),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: continueButton.safeAreaLayoutGuide.bottomAnchor, multiplier: 6),
            continueButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
