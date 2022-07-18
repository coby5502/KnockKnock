//
//  NewAlarmView.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/19.
//

import UIKit

final class NewAlarmButton: UIButton {
    
    // MARK: - property
    
    private let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.btnPlus
        imageView.tintColor = .white
        return imageView
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
        self.addSubview(plusImageView)
        
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        
        plusImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        plusImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        plusImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        plusImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func configUI() {
        backgroundColor = .blue002
        layer.cornerRadius = 40
        makeShadow(color: .black, opacity: 0.3, offset: CGSize(width: 0, height: 4), radius: 10)
    }
}
