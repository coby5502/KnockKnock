//
//  MainButton.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit

final class MainButton: UIButton {
    
    private enum Size {
        static let spacing: CGFloat = 16.0
        static let height: CGFloat = 60.0
        static let width: CGFloat = UIScreen.main.bounds.size.width - Size.spacing * 2
    }
    
    // MARK: - property
    
    override var isHighlighted: Bool {
         get {
             return super.isHighlighted
         }
         set {
             backgroundColor = isHighlighted ? .mainRed : .mainRed.withAlphaComponent(0.5)
             super.isHighlighted = newValue
         }
     }
    
    var title: String? {
        didSet { setupAttribute() }
    }
    
    var isDisabled: Bool = false {
        didSet { setupAttribute() }
    }
    
    var hasShadow: Bool = false {
        didSet { setupShadow() }
    }

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        render()
        configUI()
    }
    
    // MARK: - func
    
    private func render() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: Size.width),
            self.heightAnchor.constraint(equalToConstant: Size.height)
        ])
    }
    
    private func configUI() {
        layer.cornerRadius = 30
        titleLabel?.font =  UIFont.systemFont(ofSize: 20, weight: .regular)
        setTitleColor(.white.withAlphaComponent(0.5), for: .highlighted)
    }
    
    private func setupAttribute() {
        if let title = title {
            setTitle(title, for: .normal)
        }
        
        // COLOR: disable색상 추가 #823029
        backgroundColor = isDisabled ? .mainRed.withAlphaComponent(0.3) : .mainRed
        setTitleColor(isDisabled ? .white.withAlphaComponent(0.3) : .white, for: .normal)
        isEnabled = !isDisabled
    }
    
    private func setupShadow() {
        makeShadow(color: .shadowRed, opacity: 1.0, offset: CGSize(width: 0, height: 6), radius: 1)
    }
}
