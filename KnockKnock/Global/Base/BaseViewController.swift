//
//  BaseViewController.swift
//  KnockKnock
//
//  Created by COBY_PRO on 2022/07/18.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - property
    
    private lazy var backButton: UIButton = {
        let button = BackButton()
        let buttonAction = UIAction { _ in
            self.navigationController?.popViewController(animated: true)
        }
        button.addAction(buttonAction, for: .touchUpInside)
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
        setupBackButton()
        hidekeyboardWhenTappedAround()
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func render() {
        // Override Layout
    }
    
    func configUI() {
        view.backgroundColor = .white
    }
    
    func setupNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        let appearance = UINavigationBarAppearance()
        let font = UIFont.systemFont(ofSize: 14, weight: .regular)
        let largeFont = UIFont.systemFont(ofSize: 34, weight: .semibold)
        
        appearance.titleTextAttributes = [.font: font]
        appearance.largeTitleTextAttributes = [.font: largeFont]
        appearance.shadowColor = .clear
        appearance.backgroundColor = .grey003
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - helper func
    
    func makeBarButtonItem<T: UIView>(with view: T) -> UIBarButtonItem {
        return UIBarButtonItem(customView: view)
    }
    
    func removeBarButtonItemOffset(with button: UIButton, offsetX: CGFloat = 0, offsetY: CGFloat = 0) -> UIView {
        let offsetView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        offsetView.bounds = offsetView.bounds.offsetBy(dx: offsetX, dy: offsetY)
        offsetView.addSubview(button)
        return offsetView
    }
    
    // MARK: - private func
    
    private func setupBackButton() {
        let leftOffsetBackButton = removeBarButtonItemOffset(with: backButton, offsetX: 10)
        let backButton = makeBarButtonItem(with: leftOffsetBackButton)
        
        navigationItem.leftBarButtonItem = backButton
    }
}
