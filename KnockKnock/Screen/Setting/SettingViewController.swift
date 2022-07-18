//
//  SettingViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit
import FirebaseAuth

class SettingViewController: BaseViewController {
    
    private let signOutButton: MainButton = {
        let button = MainButton()
        button.title = "Log Out"
        button.isDisabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(signOutButton)
        
        signOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signOutButton.widthAnchor.constraint(equalToConstant: 100),
            signOutButton.heightAnchor.constraint(equalToConstant: 100),
            signOutButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            signOutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .automatic
        
        title = "Setting"
    }
    
    @objc private func logOutTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
        } catch {
            print("An error occurred")
        }
    }
}
