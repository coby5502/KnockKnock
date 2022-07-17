//
//  MainViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/17.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log Out", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(signOutButton)
        signOutButton.frame = CGRect(x: 20, y: 150, width: view.frame.size.width-40, height: 52)
        signOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
    }
    
    @objc private func logOutTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
        } catch {
            print("An error occurred")
        }
    }
}

