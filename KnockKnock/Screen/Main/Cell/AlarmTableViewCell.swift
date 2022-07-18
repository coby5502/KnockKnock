//
//  KnockCollectionViewCell.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit

final class AlarmTableViewCell: BaseTableViewCell {
    
    static let cellId = "AlarmCell"
    
    // MARK: - property
    
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
    
    let withLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "With"
        return label
    }()
    
    let alarmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.alarmOn
        return imageView
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func render() {
        contentView.addSubview(alarmTimeLabel)
        contentView.addSubview(alarmInfoLabel)
        contentView.addSubview(withLabel)
        contentView.addSubview(alarmImageView)
        
        alarmTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        withLabel.translatesAutoresizingMaskIntoConstraints = false
        alarmImageView.translatesAutoresizingMaskIntoConstraints = false
        
        alarmTimeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        alarmTimeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        alarmInfoLabel.topAnchor.constraint(equalTo: alarmTimeLabel.bottomAnchor, constant: 12).isActive = true
        alarmInfoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        withLabel.topAnchor.constraint(equalTo: alarmInfoLabel.bottomAnchor, constant: 20).isActive = true
        withLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        alarmImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        alarmImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        alarmImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        alarmImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    override func configUI() {
        clipsToBounds = true
        
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 20
        contentView.makeShadow(color: UIColor.black, opacity: 0.12, offset: CGSize(width: 0, height: 4), radius: 20)
    }
}