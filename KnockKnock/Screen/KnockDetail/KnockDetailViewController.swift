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
        static let collectionHorizontalSpacing: CGFloat = 0
        static let collectionVerticalSpacing: CGFloat = 0
        static let cellWidth: CGFloat = UIScreen.main.bounds.size.width - collectionHorizontalSpacing * 2
        static let cellHeight: CGFloat = 100
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
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = Size.collectionInset
        flowLayout.itemSize = CGSize(width: Size.cellWidth, height: Size.cellHeight)
        flowLayout.minimumLineSpacing = 0
        return flowLayout
    }()
    
    private lazy var listCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(cell: MemberCollectionViewCell.self,
                                forCellWithReuseIdentifier: MemberCollectionViewCell.className)
        return collectionView
    }()
    
    private let deleteButton: MainButton = {
        let button = MainButton()
        button.label.text = "delete"
        return button
    }()
    
    override func render() {
        if alarmIsOn {
            alarmButton.setImage(ImageLiterals.alarmOn, for: .normal)
        } else {
            alarmButton.setImage(ImageLiterals.alarmOff, for: .normal)
        }
        alarmButton.addTarget(self, action: #selector(didTapAlarmButton), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
        
        view.addSubview(alarmTimeLabel)
        view.addSubview(alarmInfoLabel)
        view.addSubview(alarmButton)
        view.addSubview(memberLabel)
        view.addSubview(listCollectionView)
        view.addSubview(deleteButton)
        
        alarmTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmButton.translatesAutoresizingMaskIntoConstraints = false
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        listCollectionView.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        listCollectionView.topAnchor.constraint(equalTo: memberLabel.bottomAnchor, constant: 20).isActive = true
        listCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        listCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        listCollectionView.bottomAnchor.constraint(equalTo: deleteButton.topAnchor, constant: -20).isActive = true
        
        deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
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
    
    @objc private func didTapDeleteButton() {
        self.navigationController?.popViewController(animated: true)
    }
}


// MARK: - UICollectionViewDataSource
extension KnockDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MemberCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.nameLabel.text = data[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension KnockDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
