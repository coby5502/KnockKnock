//
//  AddFriendCollectionViewCell.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/19.
//

import UIKit

final class AddFriendCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - property
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let knockButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue001
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    override func render() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(knockButton)
        
        knockButton.addTarget(self, action: #selector(didTapKnockButton), for: .touchUpInside)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        knockButton.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        knockButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        knockButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        knockButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        knockButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    override func configUI() {
        clipsToBounds = true
        makeBorderLayer(color: .white.withAlphaComponent(0.5))
    }
    
    @objc private func didTapKnockButton() {
        print("add")
    }
}
