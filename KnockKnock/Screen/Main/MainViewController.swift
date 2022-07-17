//
//  MainViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/17.
//

import UIKit
import FirebaseAuth

class MainViewController: BaseViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Today's Knock"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let settingButton = SettingButton()
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log Out", for: .normal)
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

        let titleLabel = makeBarButtonItem(with: titleLabel)
        let settingButton = makeBarButtonItem(with: settingButton)

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.leftBarButtonItem = titleLabel
        navigationItem.rightBarButtonItem = settingButton
    }
    
    @objc private func logOutTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
        } catch {
            print("An error occurred")
        }
    }
}

