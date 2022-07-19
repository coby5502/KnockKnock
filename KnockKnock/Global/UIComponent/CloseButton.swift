//
//  CloseButton.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/19.
//

import UIKit

final class CloseButton: UIButton {

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: .init(origin: .zero, size: .init(width: 44, height: 44)))
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.setImage(ImageLiterals.btnXmark, for: .normal)
        self.tintColor = .mainBlue
    }
}
