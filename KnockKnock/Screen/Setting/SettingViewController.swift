//
//  SettingViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit
import FirebaseAuth

class SettingViewController: BaseViewController {
    
    private enum Size {
        static let collectionHorizontalSpacing: CGFloat = 20.0
        static let collectionVerticalSpacing: CGFloat = 20.0
        static let cellWidth: CGFloat = UIScreen.main.bounds.size.width - collectionHorizontalSpacing * 2
        static let cellHeight: CGFloat = 80
        static let collectionInset = UIEdgeInsets(top: collectionVerticalSpacing,
                                                  left: collectionHorizontalSpacing,
                                                  bottom: collectionVerticalSpacing,
                                                  right: collectionHorizontalSpacing)
    }
    
    private let logOutButton: MainButton = {
        let button = MainButton()
        button.label.text = "Log Out"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logOutButton)
        
        logOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logOutButton.widthAnchor.constraint(equalToConstant: Size.cellWidth),
            logOutButton.heightAnchor.constraint(equalToConstant: Size.cellHeight),
            logOutButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            logOutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
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
