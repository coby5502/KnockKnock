//
//  SettingViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit
import FirebaseAuth

class SettingViewController: BaseViewController {
    
    private let logOutButton: MainButton = {
        let button = MainButton()
        button.label.text = "Log Out"
        return button
    }()
    
    private let findFriendsButton: MainButton = {
        let button = MainButton()
        button.label.text = "Find Friends"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        findFriendsButton.addTarget(self, action: #selector(didfindFriendsButtonTapped), for: .touchUpInside)
        logOutButton.addTarget(self, action: #selector(didlogOutButtonTapped), for: .touchUpInside)
        
        view.addSubview(findFriendsButton)
        view.addSubview(logOutButton)
        
        findFriendsButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        findFriendsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        findFriendsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        findFriendsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        findFriendsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        logOutButton.topAnchor.constraint(equalTo: findFriendsButton.bottomAnchor, constant: 10).isActive = true
        logOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .automatic
        
        title = "Setting"
    }
    
    @objc private func didfindFriendsButtonTapped() {
        let viewController = FindFriendViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc private func didlogOutButtonTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            let viewController = LogInViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        } catch {
            print("An error occurred")
        }
    }
}
