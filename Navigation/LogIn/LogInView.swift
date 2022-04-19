//
//  LogInView.swift
//  Navigation
//
//  Created by alisa on 02.03.2022.
//

import UIKit
 
class LogInView: UIView {
    
    weak var delegate: LogInViewDelegate?
 
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
    
    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество символов должно содержать не менее \(minLength) символов"
        label.textColor = .red
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 8
        label.contentMode = .scaleToFill
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var topConstraintButton: NSLayoutConstraint?
    private let minLength = 5
    private let maxLengthPhone = 11
    
    private func validPassword(password : String) -> Bool {
        let regexPassword = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&*]).{\(minLength),}$"
        return NSPredicate(format: "SELF MATCHES %@", regexPassword).evaluate(with: passwordTextField.text!)
    }
    
    private func validLoginEmail(login: String) -> Bool {
        let regexEmail = "^(?=.*[a-z])(?=.*[@]).{\(minLength),}$"
        return NSPredicate(format: "SELF MATCHES %@", regexEmail).evaluate(with: loginTextField.text!)
    }
    
    private func validLoginPhone(login: String) -> Bool {
        let regexPhone = "^(?=.*[0-9]).{\(maxLengthPhone - 1),\(maxLengthPhone)}$"
        return NSPredicate(format: "SELF MATCHES %@", regexPhone).evaluate(with: loginTextField.text!)
    }
    
    @objc func buttonPressed() {
        guard let login = self.loginTextField.text else {return}
        guard let password = self.passwordTextField.text else {return}
        
        let warningEmpty = warningEmpty(login, password)
        let warningAmount = warningAmount(password)
        let warningValid = warningValid(login, password)
        
//        if warningEmpty || warningAmount || warningValid {
//            stackView.layer.borderColor = warningEmpty ? UIColor.red.cgColor : UIColor.lightGray.cgColor
//            warningLabel.isHidden = warningAmount ? false : true
//            self.topConstraintButton?.constant = warningAmount ? 16 + self.warningLabel.font.pointSize : 0
//            if warningValid { delegate?.alertLogIn() }
//        } else {
            delegate?.didTapButton()
 //       }
    }
    
    func warningEmpty(_ login: String, _ password: String) -> Bool {
        return login == "" || password == "" ? true : false
    }
    
    func warningAmount(_ password: String) -> Bool {
        return password.count < minLength ? true : false
    }
    
    func warningValid(_ login: String, _ password: String) -> Bool {
        return validPassword(password: password) && (validLoginEmail(login: login) || validLoginPhone(login: login)) ? false : true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
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
        self.addSubview(self.warningLabel)
        
        let logoImageViewConstraints = self.logoImageViewConstraints()
        let stackViewConstraints = self.stackViewConstraints()
        let logInButtonConstraints = self.logInButtonConstraints()
        let warningLabelConstraints = self.warningLabelConstraints()
 
        NSLayoutConstraint.activate(logoImageViewConstraints + stackViewConstraints + logInButtonConstraints + warningLabelConstraints)
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
        self.topConstraintButton = self.logInButton.topAnchor.constraint(equalTo: self.warningLabel.topAnchor)
        let heightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        let leadingConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = self.logInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
 
        return [
            self.topConstraintButton, leadingConstraint, trailingConstraint, heightConstraint
        ].compactMap({$0})
    }
    
    private func warningLabelConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.warningLabel.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let leadingConstraint = self.warningLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = self.warningLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
 
        return [
            topConstraint, leadingConstraint, trailingConstraint
        ]
    }
}

