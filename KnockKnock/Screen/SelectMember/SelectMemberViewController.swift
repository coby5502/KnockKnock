//
//  SelectMemberViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/19.
//

import UIKit

class SelectMemberViewController: BaseViewController {
    
    private let closeButton = CloseButton()
    
    private let completeButton: MainButton = {
        let button = MainButton()
        button.label.text = "Complete"
        return button
    }()
    
    override func render() {
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        completeButton.addTarget(self, action: #selector(didTapCompleteButton), for: .touchUpInside)
        
        view.addSubview(completeButton)
        
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        
        completeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        completeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        completeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        completeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let closeButton = makeBarButtonItem(with: closeButton)

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.rightBarButtonItem = closeButton
        
        title = "Select Member"
    }
    
    @objc private func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapCompleteButton() {
        dismiss(animated: true, completion: nil)
    }
}
