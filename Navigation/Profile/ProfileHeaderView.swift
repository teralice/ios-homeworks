//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by alisa on 16.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "3408"))
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Dog Man"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var statusTextView1: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .lightGray
        textView.font = .systemFont(ofSize: 14)
        textView.textColor = .gray
        textView.text = "Status"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Good news, everybody!"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {
        self.addSubview(self.avatarImageView)
        self.addSubview(self.fullNameLabel)
        self.addSubview(self.statusButton)
        self.addSubview(self.statusTextField)
        
        let topAvatarImageConstraint = self.avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leadingAvatarImageConstraint = self.avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let widthAvatarImageConstraint = self.avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        let heightAvatarImageConstraint = self.avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        
        let topFullNameLabelConstraint = self.fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27)
        let leadingFullNameLabelConstraint = self.fullNameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16) //?
        let trailingFullNameLabelConstraint = self.fullNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        
        let bottomTextFieldConstraint = self.statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)
        let leadingTextFieldConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor)
        let trailingTextFieldConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor)
        
        let topSetStatusButton = self.statusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
        let leadingSetStatusButton = self.statusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailingSetStatusButton = self.statusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightSetStatusButton = self.statusButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            topAvatarImageConstraint, leadingAvatarImageConstraint, widthAvatarImageConstraint,
            heightAvatarImageConstraint, topFullNameLabelConstraint, leadingFullNameLabelConstraint,
            trailingFullNameLabelConstraint, topSetStatusButton, leadingSetStatusButton, trailingSetStatusButton,
            heightSetStatusButton, bottomTextFieldConstraint, leadingTextFieldConstraint, trailingTextFieldConstraint
        ].compactMap({ $0}))
    }
    
    @objc func buttonPressed() {
        print(statusTextField.text!)
    }
}

