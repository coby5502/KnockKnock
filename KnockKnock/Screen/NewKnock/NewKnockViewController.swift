//
//  NewKnockViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/19.
//

import UIKit
import FirebaseAuth

class NewKnockViewController: BaseViewController {
    
    private var alarmIsOn: Bool = true
    
    private enum Size {
        static let collectionHorizontalSpacing: CGFloat = 20.0
        static let collectionVerticalSpacing: CGFloat = 20.0
        static let cellWidth: CGFloat = UIScreen.main.bounds.size.width - collectionHorizontalSpacing * 2
        static let cellHeight: CGFloat = 180
        static let collectionInset = UIEdgeInsets(top: collectionVerticalSpacing,
                                                  left: collectionHorizontalSpacing,
                                                  bottom: collectionVerticalSpacing,
                                                  right: collectionHorizontalSpacing)
    }
    
    let alarmTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        label.textColor = .black
        label.text = "10:00 AM"
        return label
    }()
    
    let alarmInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "즐거운 아침 회의 시간"
        return label
    }()
    
    let alarmButton = UIButton()

    override func render() {
        if alarmIsOn {
            alarmButton.setImage(ImageLiterals.alarmOn, for: .normal)
        } else {
            alarmButton.setImage(ImageLiterals.alarmOff, for: .normal)
        }
        alarmButton.addTarget(self, action: #selector(didTapAlarmButton), for: .touchUpInside)
        
        view.addSubview(alarmTimeLabel)
        view.addSubview(alarmInfoLabel)
        view.addSubview(alarmButton)
        
        alarmTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmButton.translatesAutoresizingMaskIntoConstraints = false
        
        alarmTimeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        alarmTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        alarmInfoLabel.topAnchor.constraint(equalTo: alarmTimeLabel.bottomAnchor, constant: 8).isActive = true
        alarmInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        alarmButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        alarmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        alarmButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        alarmButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        title = "New Knock"
    }
    
    @objc private func didTapAlarmButton() {
        alarmIsOn = !alarmIsOn
        
        if alarmIsOn {
            alarmButton.setImage(ImageLiterals.alarmOn, for: .normal)
        } else {
            alarmButton.setImage(ImageLiterals.alarmOff, for: .normal)
        }
    }
}
