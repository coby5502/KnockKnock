//
//  SelectMemberViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/19.
//

import UIKit

class SelectMemberViewController: BaseViewController {
    
    private let data = ["Coby", "Skipp", "Key", "Coby", "Skipp", "Key", "Coby", "Skipp", "Key"]
    
    private enum Size {
        static let collectionHorizontalSpacing: CGFloat = 20.0
        static let collectionVerticalSpacing: CGFloat = 20.0
        static let cellWidth: CGFloat = UIScreen.main.bounds.size.width - collectionHorizontalSpacing * 2
        static let cellHeight: CGFloat = 50
        static let collectionInset = UIEdgeInsets(top: collectionVerticalSpacing,
                                                  left: collectionHorizontalSpacing,
                                                  bottom: collectionVerticalSpacing,
                                                  right: collectionHorizontalSpacing)
    }
    
    private let closeButton = CloseButton()
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = Size.collectionInset
        flowLayout.itemSize = CGSize(width: Size.cellWidth, height: Size.cellHeight)
        flowLayout.minimumLineSpacing = 10
        return flowLayout
    }()
    
    private lazy var listCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(cell: AddFriendCollectionViewCell.self,
                                forCellWithReuseIdentifier: AddFriendCollectionViewCell.className)
        return collectionView
    }()
    
    private let completeButton: MainButton = {
        let button = MainButton()
        button.label.text = "Complete"
        return button
    }()
    
    override func render() {
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        completeButton.addTarget(self, action: #selector(didTapCompleteButton), for: .touchUpInside)
        
        view.addSubview(listCollectionView)
        view.addSubview(completeButton)
        
        listCollectionView.translatesAutoresizingMaskIntoConstraints = false
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        
        listCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        listCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        listCollectionView.bottomAnchor.constraint(equalTo: completeButton.topAnchor, constant: -30).isActive = true
        listCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
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

// MARK: - UICollectionViewDataSource
extension SelectMemberViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AddFriendCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.nameLabel.text = data[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension SelectMemberViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
