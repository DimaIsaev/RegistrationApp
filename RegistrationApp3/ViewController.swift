//
//  ViewController.swift
//  RegistrationApp3
//
//  Created by Дмитрий Исаев on 13.08.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var builder = {
        return ViewBuilder(controller: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appPurple
        
        builder.setImageView()
        builder.setContentView()
        builder.setLogInTextView()
        builder.setForgotButton()
        builder.setLogInButton()
        builder.setOrTitle()
        builder.setAuthButtons()
        builder.setSignUpText()
    }


}

