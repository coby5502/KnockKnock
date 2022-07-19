//
//  MainViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/17.
//

import UIKit
import FirebaseAuth

class MainViewController: BaseViewController {
    
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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Today's Meetings"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let settingButton = SettingButton()
    
    private let newAlarmButton = NewAlarmButton()
    
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
        collectionView.register(cell: AlarmCollectionViewCell.self,
                                forCellWithReuseIdentifier: AlarmCollectionViewCell.className)
        return collectionView
    }()

    override func render() {
        view.addSubview(listCollectionView)
        view.addSubview(newAlarmButton)
        
        settingButton.addTarget(self, action: #selector(didTapSettingButton), for: .touchUpInside)
        newAlarmButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        
        listCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newAlarmButton.translatesAutoresizingMaskIntoConstraints = false
        
        listCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        listCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        listCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        listCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        newAlarmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        newAlarmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        newAlarmButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        newAlarmButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
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
    
    @objc private func didTapSettingButton() {
        let viewController = SettingViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func didTapPlusButton() {
        let viewController = NewKnockViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func didTapKnockCell() {
        let viewController = KnockDetailViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AlarmCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapKnockCell()
    }
}
