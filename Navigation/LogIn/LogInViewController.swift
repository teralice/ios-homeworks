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
        scrollView.contentSize = self.view.bounds.size
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var logInView: LogInView = {
        let view = LogInView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        logInView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(logInView)
        
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewRightConstraint = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollViewLeftConstraint = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        
        let topConstraint = self.logInView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let leadingConstraint = self.logInView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.logInView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.logInView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            scrollViewTopConstraint,
            scrollViewRightConstraint,
            scrollViewLeftConstraint,
            topConstraint,
            leadingConstraint,
            trailingConstraint,
            bottomConstraint,
            scrollViewBottomConstraint
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

extension LogInViewController: LogInViewDelegate {
    
    func didTapButton() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    func alertLogIn() {
        let alertController = UIAlertController(title: "Неверно введен логин или пароль", message: "Пожалуйста, проверьте вводимые значения и попробуйте еще раз. Напоминаем, что логином является ваш номер телефона или почта. Если забыли пароль, сообщите в службу поддержки пользователей.", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(actionOK)
        self.present(alertController, animated: true, completion: nil)
    }
}
