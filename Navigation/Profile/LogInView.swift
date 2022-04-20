//
//  LogInView.swift
//  Navigation
//
//  Created by alisa on 02.03.2022.
//

import UIKit

protocol MyViewDelegate: AnyObject {
    func didTapButton()
}
 
class LogInView: UIView {
    
    weak var delegate: MyViewDelegate?
 
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email of phone"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "AccentColor")
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        let bottomLine = CALayer()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "AccentColor")
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.distribution = .fillEqually
        stackView.spacing = 0.5
        stackView.backgroundColor = .lightGray
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(named: "ColorSet")
        button.setTitleColor(.white, for: .normal)
        button.backgroundImage(for: .selected)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonPressed() {
        self.delegate?.didTapButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
        self.tapRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.backgroundColor = .white
        
        self.addSubview(self.logoImageView)
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.loginTextField)
        self.stackView.addArrangedSubview(self.passwordTextField)
        self.addSubview(self.logInButton)
        
        //логотип, стек, кнопка
        let logoImageViewConstraints = self.logoImageViewConstraints()
        let stackViewConstraints = self.stackViewConstraints()
        let logInButtonConstraints = self.logInButtonConstraints()
 
        NSLayoutConstraint.activate(logoImageViewConstraints + stackViewConstraints + logInButtonConstraints)
    }
    
    private func logoImageViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120)
        let widthConstraint = self.logoImageView.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = self.logoImageView.heightAnchor.constraint(equalToConstant: 100)
        let xpositionConstraint = self.logoImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
 
        return [
            topConstraint, widthConstraint, heightConstraint, xpositionConstraint
        ]
    }
    
    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120)
        let heightConstraint = self.stackView.heightAnchor.constraint(equalToConstant: 100)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
 
        return [
            topConstraint, leadingConstraint, trailingConstraint, heightConstraint
        ]
    }
    
    private func logInButtonConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.logInButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let heightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        let leadingConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = self.logInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
 
        return [
            topConstraint, leadingConstraint, trailingConstraint, heightConstraint
        ]
    }
    
    func tapRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hundleTapGesture))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hundleTapGesture(sender: UITapGestureRecognizer) {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
}

