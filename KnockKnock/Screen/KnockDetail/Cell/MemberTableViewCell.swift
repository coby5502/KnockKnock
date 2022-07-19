//
//  MemberTableViewCell.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/19.
//

import UIKit

final class MemberTableViewCell: BaseTableViewCell {
    
    static let cellId = "MemberTableViewCell"
    
    // MARK: - property
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let knockButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue001
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Knock", for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(knockButton)
        
        knockButton.addTarget(self, action: #selector(didTapKnockButton), for: .touchUpInside)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        knockButton.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        knockButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        knockButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        knockButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        knockButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    override func configUI() {
        clipsToBounds = true
        makeBorderLayer(color: .white.withAlphaComponent(0.5))
    }
    
    @objc private func didTapKnockButton() {
        print("knock")
    }
}
