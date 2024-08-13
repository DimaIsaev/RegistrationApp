//
//  ViewManager.swift
//  RegistrationApp3
//
//  Created by Дмитрий Исаев on 13.08.2024.
//

import UIKit

class ViewManager {
  
    static let shared = ViewManager()
    private init () {}
    
    lazy var banerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .rectangle401
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 178).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 178).isActive = true
        return imageView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var forgotPasButton: UIButton = {
        let btn = UIButton(primaryAction: UIAction(handler: { _ in
            
        }))
        btn.setTitle("Forgot Password?", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var logInButton: UIButton = {
        let btn = UIButton(primaryAction: UIAction(handler: { _ in
            
        }))
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        btn.backgroundColor = .appYellow
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return btn
    }()
    
    lazy var orTitle: UILabel = {
        let title = UILabel()
        title.text = "Or"
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var signUpTextStack: UIStackView = {
        let title = UILabel()
        title.text = "Dont’t have an account?"
        title.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        title.textColor = .black

        let button = UIButton(primaryAction: UIAction(handler: { _ in
            
        }))
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.setTitleColor(.appYellow, for: .normal)
        
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 2
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        hStack.addArrangedSubview(title)
        hStack.addArrangedSubview(button)
        
        return hStack
    }()
    
    func getlogTextView(textField: UITextField, placeholder: String, isPassword: Bool = false) -> UIStackView {
        lazy var hidePasswordButton: UIButton = {
            let btn = UIButton(primaryAction: action)
            btn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            btn.tintColor = .black
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
        
        lazy var action = UIAction { _ in
            textField.isSecureTextEntry.toggle()
            
            if textField.isSecureTextEntry {
                hidePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            } else {
                hidePasswordButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            }
        }
        
        lazy var placeholderView: UIView = {
            let title = UILabel()
            title.text = placeholder
            title.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            title.textColor = .gray
            title.translatesAutoresizingMaskIntoConstraints = false
            
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(title)
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 15),
                title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
            ])
            return view
        }()
        
        lazy var logView: UIView = {
            let view = UIView()
            view.backgroundColor = .appLightGray
            view.layer.cornerRadius = 15
            view.addSubview(textField)
            
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.isSecureTextEntry = isPassword
            
            NSLayoutConstraint.activate([
                textField.topAnchor.constraint(equalTo: view.topAnchor),
                textField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                textField.heightAnchor.constraint(equalToConstant: 52)
            ])
            
            if isPassword {
                view.addSubview(hidePasswordButton)
                
                NSLayoutConstraint.activate([
                    hidePasswordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    hidePasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
                ])
            }
            
            return view
        }()
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 7
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        vStack.addArrangedSubview(placeholderView)
        vStack.addArrangedSubview(logView)
        
        return vStack
    }
    
    func getAuthButtons() -> UIStackView {
        let icons: [UIImage] = [.image6, .image7, .image8]
        
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.distribution = .equalSpacing
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        icons.forEach { icon in
            hStack.addArrangedSubview(getAuthButton(icon: icon))
        }
        
        return hStack
    }
    
    private func getAuthButton(icon: UIImage) -> UIButton {
        let btn = UIButton()
        btn.setImage(icon, for: .normal)
        btn.backgroundColor = .appLightGray
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return btn
    }
}
