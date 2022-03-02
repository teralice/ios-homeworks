//
//  LogInViewController.swift
//  Navigation
//
//  Created by alisa on 02.03.2022.
//

import UIKit
 
class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var logInView: LogInView = {
        let view = LogInView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.isHidden = false
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(logInView)
        
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        
        let topConstraint = self.logInView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.logInView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.logInView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let bottomConstraint = self.logInView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
            scrollViewTopConstraint, scrollViewRightConstraint, scrollViewBottomConstraint, scrollViewLeftConstraint, topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)    // подписаться на уведомления
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)    // отписаться от уведомлений
        let nc = NotificationCenter.default
        nc.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Изменение отступов при появлении клавиатуры
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    @objc private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        
    }
}

