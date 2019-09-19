//
//  PasswordField.swift
//  PasswordTextField
//
//  Created by Ben Gohlke on 6/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PasswordField: UIControl {
    
    // Public API - these properties are used to fetch the final password and strength values
    
    enum passwordStrength: String {
        case weakPasssword = "Password is weak"
        case mediumPassword = "Password is okay"
        case strongPassword = "Password is strong"
    }
    
    
    private (set) var password: String = " "
    
    // Password Strength
    
    private let standardMargin: CGFloat = 8.0
    private let textFieldContainerHeight: CGFloat = 50.0
    private let textFieldMargin: CGFloat = 6.0
    private let colorViewSize: CGSize = CGSize(width: 60.0, height: 5.0)
    
    private let labelTextColor = UIColor(hue: 233.0/360.0, saturation: 16/100.0, brightness: 41/100.0, alpha: 1)
    private let labelFont = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
    
    private let textFieldBorderColor = UIColor(hue: 208/360.0, saturation: 80/100.0, brightness: 94/100.0, alpha: 1)
    private let bgColor = UIColor(hue: 0, saturation: 0, brightness: 97/100.0, alpha: 1)
    
    // States of the password strength indicators
    private let unusedColor = UIColor(hue: 210/360.0, saturation: 5/100.0, brightness: 86/100.0, alpha: 1)
    private let weakColor = UIColor(hue: 0/360, saturation: 60/100.0, brightness: 90/100.0, alpha: 1)
    private let mediumColor = UIColor(hue: 39/360.0, saturation: 60/100.0, brightness: 90/100.0, alpha: 1)
    private let strongColor = UIColor(hue: 132/360.0, saturation: 60/100.0, brightness: 75/100.0, alpha: 1)
    
    private var titleLabel: UILabel = UILabel()
    private var textField: UITextField = UITextField()
    private var showHideButton: UIButton = UIButton()
    private var weakView: UIView = UIView()
    private var mediumView: UIView = UIView()
    private var strongView: UIView = UIView()
    private var strengthDescriptionLabel: UILabel = UILabel()
    
    func setup() {
        
        // Lay out your subviews here
        
        // Password Label
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        titleLabel.text = "ENTER PASSWORD"
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        // Password TextField
        
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        textField.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1.0).isActive = true
        textField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        textField.layer.borderWidth = 1.5
        textField.layer.cornerRadius = 12
        textField.placeholder = "Enter Password"
        textField.font = UIFont.systemFont(ofSize: 10, weight: .light)
        textField.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        
        // Show/hode Password Button
       
        addSubview(showHideButton)
        showHideButton.translatesAutoresizingMaskIntoConstraints = false
        showHideButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 300).isActive = true
        showHideButton.topAnchor.constraint(equalTo: topAnchor, constant: 40.5).isActive = true
        showHideButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        showHideButton.setImage(UIImage(named: "eyes-closed"), for: .normal)
        
        // Strength Labels
        
        addSubview(weakView)
        weakView.translatesAutoresizingMaskIntoConstraints = false
        weakView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        weakView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1.0).isActive = true
        weakView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -280).isActive = true
        weakView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        weakView.layer.backgroundColor = unusedColor.cgColor
        
        addSubview(mediumView)
        mediumView.translatesAutoresizingMaskIntoConstraints = false
        mediumView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105).isActive = true
        mediumView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1.0).isActive = true
        mediumView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -170).isActive = true
        mediumView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        mediumView.layer.backgroundColor = unusedColor.cgColor
        
        addSubview(strongView)
        strongView.translatesAutoresizingMaskIntoConstraints = false
        strongView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 215).isActive = true
        strongView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1.0).isActive = true
        strongView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65).isActive = true
        strongView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        strongView.layer.backgroundColor = unusedColor.cgColor
        
        // Password Strength Label
        
        addSubview(strengthDescriptionLabel)
        strengthDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        strengthDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        strengthDescriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: weakView.bottomAnchor, multiplier: 1.0).isActive = true
        strengthDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -380).isActive = true
        
        

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}

extension PasswordField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        // TODO: send new text to the determine strength method
        return true
        
    }
}
