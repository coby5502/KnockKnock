//
//  MainButton.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit

final class MainButton: UIButton {
    
    // MARK: - property
    
    let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func render() {
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func configUI() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.masksToBounds = false
        makeShadow(color: UIColor.black, opacity: 0.12, offset: CGSize(width: 0, height: 4), radius: 20)
    }
}
