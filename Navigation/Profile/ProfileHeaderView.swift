//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by alisa on 16.02.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "3408"))
        imageView.layer.cornerRadius = 74
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
        textField.placeholder = "О чем вы думаете сейчас?"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.text = "Заполните статус"
        label.textColor = .red
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 8
        label.contentMode = .scaleToFill
        label.textAlignment = .left
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .systemGray6
        self.drawSelf()
        self.tapGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tapGesture() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hundleTapGesture(sender:)))
        self.addGestureRecognizer(tapRecognizer)
    }

    private func drawSelf() {
        self.addSubview(self.avatarImageView)
        self.addSubview(self.fullNameLabel)
        self.addSubview(self.statusButton)
        self.addSubview(self.statusTextField)
        self.addSubview(self.warningLabel)
        
        let topAvatarImageConstraint = self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let leadingAvatarImageConstraint = self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let widthAvatarImageConstraint = self.avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        let heightAvatarImageConstraint = self.avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        
        let topFullNameLabelConstraint = self.fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let leadingFullNameLabelConstraint = self.fullNameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16) 
        let trailingFullNameLabelConstraint = self.fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        let bottomTextFieldConstraint = self.statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)
        let leadingTextFieldConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor)
        let trailingTextFieldConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor)
        
        let bottomWarningLabelConstraint = self.warningLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -12)
        let leadingWarningLabelConstraint = self.warningLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor)
        let trailingWarningLabelConstraint = self.warningLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor)
        
        let topSetStatusButton = self.statusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
        let leadingSetStatusButton = self.statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingSetStatusButton = self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let heightSetStatusButton = self.statusButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            topAvatarImageConstraint, leadingAvatarImageConstraint, widthAvatarImageConstraint,
            heightAvatarImageConstraint, topFullNameLabelConstraint, leadingFullNameLabelConstraint,
            trailingFullNameLabelConstraint, topSetStatusButton, leadingSetStatusButton, trailingSetStatusButton,
            heightSetStatusButton, bottomTextFieldConstraint, leadingTextFieldConstraint, trailingTextFieldConstraint, bottomWarningLabelConstraint, leadingWarningLabelConstraint, trailingWarningLabelConstraint
        ].compactMap({ $0}))
    }
    
    @objc func buttonPressed() {
        let isEmptyStatus = statusTextField.text! == ""
        self.warningLabel.isHidden = isEmptyStatus ? false : true
        
        if !isEmptyStatus {
            print(statusTextField.text!)
        }
    }
    
    @objc func hundleTapGesture(sender: UITapGestureRecognizer) {
        self.statusTextField.resignFirstResponder()
    }
}
