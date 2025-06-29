//
//  CustomTextField.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 29.06.25.
//

import UIKit

enum CustomTextFieldType{
    case name
    case email
    case password
}

class CustomTextField: UITextField {
    
    let padding: UIEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)
    

    init(type: CustomTextFieldType, placeholder: String){
        super.init(frame: .zero)
        setupTextField(type: type, placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func setupTextField(type: CustomTextFieldType, placeholder: String) {
        self.placeholder = placeholder
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        font = .regularLivvic(selfSize: 14)
        textColor = .white
        backgroundColor = .clear
        autocorrectionType = .no
        clearButtonMode = .whileEditing
        
        switch type{
        case .name:
            keyboardType = .default
            autocapitalizationType = .words
            isSecureTextEntry = false
        case .email:
            keyboardType = .emailAddress
            autocapitalizationType = .none
            isSecureTextEntry = false
        case .password:
            keyboardType = .default
            autocapitalizationType = .none
            isSecureTextEntry = true
        }
    }
}

