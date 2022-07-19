//
//  NewKnockViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/19.
//

import UIKit
import FirebaseAuth

class NewKnockViewController: BaseViewController {
    
    private let setTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        label.text = "Set Time"
        return label
    }()
    
    private let knockInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        label.text = "Knock Info"
        return label
    }()
    
    private let closeButton = CloseButton()
    
    private let timePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    private let inputKnockInfoView: UITextField = {
        let textField = UITextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .regular)
        ]
        
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "초대코드 입력", attributes: attributes)
        
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.clipsToBounds = false
        textField.makeShadow(color: .black, opacity: 0.08, offset: CGSize(width: 0, height: 4), radius: 20)
        
        return textField
    }()
    
    private let nextButton: MainButton = {
        let button = MainButton()
        button.label.text = "Next"
        return button
    }()

    override func render() {
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        
        view.addSubview(setTimeLabel)
        view.addSubview(timePicker)
        view.addSubview(knockInfoLabel)
        view.addSubview(inputKnockInfoView)
        view.addSubview(nextButton)
        
        setTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        knockInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        inputKnockInfoView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        setTimeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        setTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        timePicker.topAnchor.constraint(equalTo: setTimeLabel.bottomAnchor, constant: 8).isActive = true
        timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        timePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        knockInfoLabel.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 30).isActive = true
        knockInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        inputKnockInfoView.topAnchor.constraint(equalTo: knockInfoLabel.bottomAnchor, constant: 20).isActive = true
        inputKnockInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        inputKnockInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        inputKnockInfoView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let closeButton = makeBarButtonItem(with: closeButton)

        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.rightBarButtonItem = closeButton
        
        title = "New Knock"
    }
    
    @objc private func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapNextButton() {
        let viewController = SelectMemberViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
