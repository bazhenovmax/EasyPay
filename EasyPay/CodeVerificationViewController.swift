//
//  CodeVerificationViewController.swift
//  EasyPay
//
//  Created by maxbazh on 4/14/26.
//

import UIKit

class CodeVerificationViewController : UIViewController {
    var otpDigits: [String] = ["", "", "", ""]
    var activeIndex: Int = 0
    
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let optStackView = UIStackView()
    var otpInputs: [OTPInputView] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setupOTPInputs()
        layout()

    }
}

extension CodeVerificationViewController {
    
    func style() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "OTP code verification"
        titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Please check your email address and write the OTP code you received here."
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        descriptionLabel.numberOfLines = 0
        
        optStackView.translatesAutoresizingMaskIntoConstraints = false
        optStackView.axis = .horizontal
        optStackView.spacing = 15
        optStackView.distribution = .fillEqually
    }
    
    func layout() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(optStackView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            optStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            optStackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            optStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
        ])
    }
}

extension CodeVerificationViewController {
    private func setupOTPInputs() {
        for i in 0..<4 {
            let inputView = OTPInputView()
            inputView.translatesAutoresizingMaskIntoConstraints = false
            inputView.tag = i
            
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.keyboardType = .numberPad
            textField.tag = i
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            
            inputView.addSubview(textField)
            otpInputs.append(inputView)
            
            optStackView.addArrangedSubview(inputView)
            
            NSLayoutConstraint.activate([
                inputView.widthAnchor.constraint(equalToConstant:  100),
                inputView.heightAnchor.constraint(equalToConstant: 100),
                
                textField.leadingAnchor.constraint(equalTo: inputView.leadingAnchor),
                textField.trailingAnchor.constraint(equalTo: inputView.trailingAnchor),
                textField.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
                textField.topAnchor.constraint(equalTo: inputView.topAnchor)
            ])
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text ?? ""
        let index = textField.tag
        
        if text.count > 1 {
            textField.text = String(text.suffix(1))
        }
        
        otpDigits[index] = textField.text ?? ""
        otpInputs[index].text = textField.text
        
        if !text.isEmpty && index < 3 {
        }
    }
}
