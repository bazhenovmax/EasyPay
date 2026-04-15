//
//  CodeVerificationViewController.swift
//  EasyPay
//
//  Created by maxbazh on 4/14/26.
//

import UIKit

class OTPInputViewController : UIViewController {
    var otpDigits: [String] = ["", "", "", ""]
    var activeIndex: Int = 0
    
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let optStackView = UIStackView()
    var otpInputs: [OTPInputView] = []
    let isReceiveEmail = UILabel()
    let resendCodeTimer = UILabel()
    let sendButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setupOTPInputs()
        layout()

    }
}

extension OTPInputViewController {
    
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
        
        isReceiveEmail.translatesAutoresizingMaskIntoConstraints = false
        isReceiveEmail.text = "Didn`t receive mail?"
        isReceiveEmail.textAlignment = .center
        
        resendCodeTimer.translatesAutoresizingMaskIntoConstraints = false
        resendCodeTimer.text = "You can resend code in 32 s"
        resendCodeTimer.textAlignment = .center
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.setTitle("Send Code", for: [])
        sendButton.backgroundColor = UIColor(named: "ButtonColor")
        sendButton.layer.cornerRadius = 28
        sendButton.setTitleColor(.black, for: .normal)
        sendButton.titleLabel?.font =  UIFont.systemFont(ofSize: 15, weight: .semibold)
        sendButton.layer.shadowColor = UIColor.shadowButton.cgColor
        sendButton.layer.shadowOpacity = 1
        sendButton.layer.shadowOffset = CGSize(width: 4, height: 6)
        sendButton.layer.shadowRadius = 0
    }
    
    func layout() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(optStackView)
        view.addSubview(isReceiveEmail)
        view.addSubview(resendCodeTimer)
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 6),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            optStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 20),
            optStackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -20),
            optStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            
            isReceiveEmail.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            isReceiveEmail.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            isReceiveEmail.topAnchor.constraint(equalTo: optStackView.bottomAnchor, constant: 30),
            
            resendCodeTimer.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            resendCodeTimer.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            resendCodeTimer.topAnchor.constraint(equalTo: isReceiveEmail.bottomAnchor, constant: 20),
            
            sendButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            sendButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: sendButton.bottomAnchor, multiplier: 6),
            sendButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension OTPInputViewController {
    private func setupOTPInputs() {
        for i in 0..<4 {
            let inputView = OTPInputView()
            inputView.translatesAutoresizingMaskIntoConstraints = false
            inputView.tag = i
            
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.keyboardType = .numberPad
            textField.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            textField.textAlignment = .center
            textField.tag = i
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            
            inputView.addSubview(textField)
            otpInputs.append(inputView)
            
            optStackView.addArrangedSubview(inputView)
            
            NSLayoutConstraint.activate([
                inputView.widthAnchor.constraint(equalToConstant:  80),
                inputView.heightAnchor.constraint(equalToConstant: 80),
                
                textField.leadingAnchor.constraint(equalTo: inputView.borderView.leadingAnchor),
                textField.trailingAnchor.constraint(equalTo: inputView.borderView.trailingAnchor),
                textField.bottomAnchor.constraint(equalTo: inputView.borderView.bottomAnchor),
                textField.topAnchor.constraint(equalTo: inputView.borderView.topAnchor)
            ])
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text ?? ""
        let index = textField.tag
        
        if text.count > 1 {
            textField.text = String(text.suffix(1))
        }
        
        otpInputs[index].text = textField.text
        
        if !text.isEmpty && index < 4 {
            activateField(at: index)
        }
    }
    
    private func activateField(at index: Int) {
        activeIndex = index
        for(i, input) in otpInputs.enumerated() {
            input.isActive = (i == index)
        }
        
        let nextTextField = otpInputs[index].subviews.first as? UITextField
        nextTextField?.becomeFirstResponder()
    }
}
