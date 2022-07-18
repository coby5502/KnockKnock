//
//  MainViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/17.
//

import UIKit
import FirebaseAuth

class MainViewController: BaseViewController {
    
    private let data = ["Coby", "Skipp", "Key"]
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Today's Knock"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let settingButton = SettingButton()
    
    private var alarmTableView =  UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmTableView.register(AlarmTableViewCell.self, forCellReuseIdentifier: AlarmTableViewCell.cellId)
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
    }

    override func render() {
        view.addSubview(alarmTableView)
        
        settingButton.addTarget(self, action: #selector(didTapSettingButton), for: .touchUpInside)
        
        alarmTableView.translatesAutoresizingMaskIntoConstraints = false
        
        alarmTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        alarmTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        alarmTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        alarmTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
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
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = alarmTableView.dequeueReusableCell(withIdentifier: AlarmTableViewCell.cellId, for: indexPath) as! AlarmTableViewCell
        cell.nameLabel.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
