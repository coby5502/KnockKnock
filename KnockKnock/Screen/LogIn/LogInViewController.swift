//
//  ViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/17.
//

import UIKit
import FirebaseAuth

class LogInViewController: BaseViewController {
    
    private let loginlabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome to Knock-Knock"
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
    
    private let logInbutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
        
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func render() {
        view.addSubview(loginlabel)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(logInbutton)
        view.addSubview(signUpButton)
        
        logInbutton.addTarget(self, action: #selector(didTapLogInbutton), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
        loginlabel.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        logInbutton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        loginlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        loginlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        emailField.topAnchor.constraint(equalTo: loginlabel.bottomAnchor, constant: 50).isActive = true
        emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        logInbutton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        logInbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        logInbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logInbutton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: logInbutton.bottomAnchor, constant: 10).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        self.navigationItem.leftBarButtonItem = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    
    @objc private func didTapLogInbutton() {
        print("Continiue button tapped")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                return
            }
            
            print("You have signed in")
            strongSelf.goHome()
        })
        
    }
    
    @objc private func didTapSignUpButton() {
        let viewController = SignUpViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func goHome() {
        let viewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }

}
