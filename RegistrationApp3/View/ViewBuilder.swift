//
//  ViewBuilder.swift
//  RegistrationApp3
//
//  Created by Дмитрий Исаев on 13.08.2024.
//

import UIKit

class ViewBuilder {
    
    private let manager = ViewManager.shared
    private var banerImage = UIImageView()
    private var contentView = UIView()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private var passwordStack = UIStackView()
    private var forgotButton = UIButton()
    private var logInButton = UIButton()
    private var orTitle = UILabel()
    private var authBtnStack = UIStackView()
    private var signUpTextStack = UIStackView()
    
    var controller: UIViewController
    var view: UIView
    
    init(controller: UIViewController) {
        self.controller = controller
        self.view = controller.view
    }
    
    func setImageView() {
        banerImage = manager.banerImage
        
        view.addSubview(banerImage)
        
        NSLayoutConstraint.activate([
            banerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 78),
            banerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setContentView() {
        contentView = manager.contentView
        
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setLogInTextView() {
        let emailStack = manager.getlogTextView(textField: emailTextField, placeholder: "Email Adress")
        passwordStack = manager.getlogTextView(textField: passwordTextField, placeholder: "Password", isPassword: true)
        
        contentView.addSubview(emailStack)
        contentView.addSubview(passwordStack)
        
        NSLayoutConstraint.activate([
            emailStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            emailStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            emailStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
            
            passwordStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            passwordStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            passwordStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 22),
        ])
    }
    
    func setForgotButton() {
        forgotButton = manager.forgotPasButton
        
        view.addSubview(forgotButton)
        
        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 7),
            forgotButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35)
        ])
    }
    
    func setLogInButton() {
        logInButton = manager.logInButton
        
        view.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 44),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
        ])
    }
    
    func setOrTitle() {
        orTitle = manager.orTitle
        
        contentView.addSubview(orTitle)
        
        NSLayoutConstraint.activate([
            orTitle.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 41),
            orTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    func setAuthButtons() {
        authBtnStack = manager.getAuthButtons()
        
        contentView.addSubview(authBtnStack)
        
        NSLayoutConstraint.activate([
            authBtnStack.topAnchor.constraint(equalTo: orTitle.bottomAnchor, constant: 41),
            authBtnStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 94),
            authBtnStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -94)
        ])
    }
    
    func setSignUpText() {
        signUpTextStack = manager.signUpTextStack
        
        contentView.addSubview(signUpTextStack)
        
        NSLayoutConstraint.activate([
            signUpTextStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUpTextStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -54),
            signUpTextStack.topAnchor.constraint(equalTo: authBtnStack.bottomAnchor, constant: 51)
        ])
    }
}
