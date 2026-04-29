//
//  UITextField+SecureToggle.swift
//  EasyPay
//
//  Created by maxbazh on 4/7/26.
//

import Foundation
import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle(buttonIcon: UIButton) {
        buttonIcon.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        buttonIcon.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        buttonIcon.addTarget(self, action: #selector(togglePasswordView(_:)), for: .touchUpInside)
        buttonIcon.contentEdgeInsets.right = 25
        buttonIcon.tintColor = .black
        rightView = buttonIcon
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: UIButton) {
        isSecureTextEntry.toggle()
        sender.isSelected.toggle()
    }
}
