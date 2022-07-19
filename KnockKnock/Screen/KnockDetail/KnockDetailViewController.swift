//
//  KnockDetailViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/19.
//

import UIKit
import FirebaseAuth

class KnockDetailViewController: BaseViewController {
    
    private var alarmIsOn: Bool = true
    
    private let data = ["Coby", "Skipp", "Key", "Coby", "Skipp", "Key", "Coby", "Skipp", "Key"]
    
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
    
    private let memberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.text = "Members List"
        return label
    }()
    
    private var memberTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memberTableView.register(MemberTableViewCell.self, forCellReuseIdentifier: MemberTableViewCell.cellId)
        memberTableView.delegate = self
        memberTableView.dataSource = self
    }

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
        view.addSubview(memberLabel)
        view.addSubview(memberTableView)
        
        alarmTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmButton.translatesAutoresizingMaskIntoConstraints = false
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        memberTableView.translatesAutoresizingMaskIntoConstraints = false
        
        alarmTimeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        alarmTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        alarmInfoLabel.topAnchor.constraint(equalTo: alarmTimeLabel.bottomAnchor, constant: 8).isActive = true
        alarmInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        alarmButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        alarmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        alarmButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        alarmButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        memberLabel.topAnchor.constraint(equalTo: alarmInfoLabel.bottomAnchor, constant: 40).isActive = true
        memberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        memberTableView.topAnchor.constraint(equalTo: memberLabel.bottomAnchor, constant: 20).isActive = true
        memberTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        memberTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        memberTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        title = "Knock-Knock"
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

extension KnockDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memberTableView.dequeueReusableCell(withIdentifier: MemberTableViewCell.cellId, for: indexPath) as! MemberTableViewCell
        cell.nameLabel.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
