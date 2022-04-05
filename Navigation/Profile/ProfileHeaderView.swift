//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by alisa on 16.02.2022.
//

import UIKit

//class ProfileHeaderView: UIView {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        self.setupView()
//    }
//
//    private func setupView() {
//        let subview = self.loadViewFromXib()
//        self.addSubview(subview)
//
//        self.nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        self.textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//
//        self.photoImageView.layer.cornerRadius = self.photoImageView.frame.height/2
//        self.photoImageView.layer.borderColor = UIColor.white.cgColor
//        self.photoImageView.layer.borderWidth = 3
//
//        self.showStatusButton.layer.cornerRadius = self.showStatusButton.frame.height/4
//        self.showStatusButton.layer.shadowOffset.height = 4
//        self.showStatusButton.layer.shadowOffset.width = 4
//        self.showStatusButton.layer.shadowColor = UIColor.black.cgColor
//        self.showStatusButton.layer.shadowOpacity = 0.7
//
//        self.showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//    }
//
//    @objc func buttonPressed() {
//        print(textField.text!)
//    }
//
//    private func loadViewFromXib() -> UIView {
//        guard let view = Bundle.main.loadNibNamed("ProfileHeaderView", owner: self, options: nil)?.first as? UIView else { return UIView() }
//
//        return view
//    }
//}

import UIKit

//protocol ProfileHeaderViewProtocol: AnyObject {
//    func didTapShowStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)
//}

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
//        textField.keyboardType = .default
//        textField.returnKeyType = UIReturnKeyType.done
//        textField.clearButtonMode = UITextField.ViewMode.whileEditing
//        textField.keyboardAppearance = .default
//        textField.autocapitalizationType = .words
//        textField.font = .systemFont(ofSize: 15)
//        textField.textColor = .systemGray2
//        textField.backgroundColor = .systemGray4
//        textField.borderStyle = .roundedRect
//        textField.returnKeyType = .next
//        textField.keyboardType = .default
//        textField.clearButtonMode = .always
//        textField.alpha = 0
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

//    private var topSetStatusButtonOn: NSLayoutConstraint?
//    private var topSetStatusButtonOff: NSLayoutConstraint?
//    weak var delegate: ProfileHeaderViewProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if (touches.first) != nil {
//            endEditing(true)
//        }
//        super.touchesBegan(touches, with: event)
//    }

    private func drawSelf() {
      //  self.addSubview(self.backView)
        self.addSubview(self.avatarImageView)
        self.addSubview(self.fullNameLabel)
        self.addSubview(self.statusButton)
        self.addSubview(self.statusTextField)
        
//        let topViewConstraint = self.backView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
//        let leadingViewConstraint = self.backView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
//        let trailingViewConstraint = self.backView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
//        let bottomViewConstraint = self.backView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        
        let topAvatarImageConstraint = self.avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leadingAvatarImageConstraint = self.avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let widthAvatarImageConstraint = self.avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        let heightAvatarImageConstraint = self.avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        
        let topFullNameLabelConstraint = self.fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27)
        let leadingFullNameLabelConstraint = self.fullNameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16) //?
        let trailingFullNameLabelConstraint = self.fullNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        
//        self.topSetStatusButtonOn = self.statusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
//        self.topSetStatusButtonOn?.priority = UILayoutPriority(rawValue: 999)
        let bottomTextFieldConstraint = self.statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)
        let leadingTextFieldConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor)
        let trailingTextFieldConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor)
        
        let topSetStatusButton = self.statusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
        let leadingSetStatusButton = self.statusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailingSetStatusButton = self.statusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightSetStatusButton = self.statusButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
          //  topViewConstraint,leadingViewConstraint, trailingViewConstraint,bottomViewConstraint,
            topAvatarImageConstraint, leadingAvatarImageConstraint, widthAvatarImageConstraint,
            heightAvatarImageConstraint, topFullNameLabelConstraint, leadingFullNameLabelConstraint,
            trailingFullNameLabelConstraint, topSetStatusButton, leadingSetStatusButton, trailingSetStatusButton,
            heightSetStatusButton, bottomTextFieldConstraint, leadingTextFieldConstraint, trailingTextFieldConstraint
        ].compactMap({ $0}))
    }
    
    @objc func buttonPressed() {
        print(statusTextField.text!)
    }

//    @objc private func didTapSetStatusButton() {
//        if self.statusTextField.isHidden {
//            self.statusTextField.alpha = 1
//
//            NSLayoutConstraint.deactivate([self.topSetStatusButtonOff].compactMap({ $0 }))
//            let topConstraint = self.statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 27)
//            let leadingConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor)
//            let trailingConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.statusLabel.trailingAnchor)
//            let heightStatusTextFieldConstraint = self.statusTextField.heightAnchor.constraint(equalToConstant: 34)
//
//            self.topSetStatusButtonOn = self.statusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 70)
//
//            NSLayoutConstraint.activate([
//                topConstraint, leadingConstraint, trailingConstraint, heightStatusTextFieldConstraint,
//                self.topSetStatusButtonOn
//            ].compactMap({ $0 }))
//            self.statusButton.setTitle("Set status", for: .normal)
//        } else {
//            self.statusTextField.isHidden = false
//            self.statusTextField.alpha = 0
//            self.statusButton.setTitle("Show status", for: .normal)
//            NSLayoutConstraint.deactivate([self.topSetStatusButtonOn].compactMap({ $0 }))
//            if self.statusTextField.text != "" {
//                self.statusLabel.text = self.statusTextField.text
//                self.statusTextField.text = .none
//
//            }
//            self.topSetStatusButtonOff = self.statusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
//
//            NSLayoutConstraint.activate([self.topSetStatusButtonOff].compactMap({ $0 }))
//        }
//        self.delegate?.didTapShowStatusButton(textFieldIsVisible: self.statusTextField.isHidden) { [weak self] in
//            self?.statusTextField.isHidden.toggle()
//        }
//    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.statusTextField.resignFirstResponder()
//        return true
//    }
}

