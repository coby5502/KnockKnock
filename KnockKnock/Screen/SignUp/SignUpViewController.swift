//
//  SignUpViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/17.
//

import UIKit
import FirebaseAuth

class SignUpViewController: BaseViewController {
    
    private let signUplabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sign Up"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email Address"
        emailField.layer.borderWidth = 1
        emailField.autocapitalizationType = .none
        emailField.layer.borderColor = UIColor.black.cgColor
        emailField.backgroundColor = .white
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        emailField.layer.cornerRadius = 12
        return emailField
    }()
    
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.layer.borderWidth = 1
        passwordField.isSecureTextEntry = true
        passwordField.layer.borderColor = UIColor.black.cgColor
        passwordField.backgroundColor = .white
        passwordField.leftViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        passwordField.layer.cornerRadius = 12
        return passwordField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()

    override func render() {
        view.addSubview(signUplabel)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signUpButton)
        
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
        signUplabel.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUplabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        signUplabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        signUplabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        emailField.topAnchor.constraint(equalTo: signUplabel.bottomAnchor, constant: 50).isActive = true
        emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    
    @objc private func didTapSignUpButton() {
        print("Continiue button tapped")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                // show account creation
                print("Account creation failed")
                return
            }
            
            print("You have signed in")
            strongSelf.goHome()
        })
    }
    
    @objc private func goHome() {
        let viewController = MainViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
}
