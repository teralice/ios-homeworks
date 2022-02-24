//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by alisa on 22.02.2022.
//

import UIKit

//protocol ProfileHeaderViewProtocol: AnyObject {
//    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void )
//}

class ProfileHeaderView: UIView {
    
   // weak var delegate: ProfileHeaderViewProtocol?
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .yellow
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
      //  button.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var buttonTopConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.backgroundColor = .white
        
        self.statusTextField.isHidden = true
        
        self.addSubview(self.infoStackView)
        self.addSubview(self.setStatusButton)
        self.addSubview(self.statusTextField)
        
        self.infoStackView.addArrangedSubview(self.avatarImageView)
        self.infoStackView.addArrangedSubview(self.labelStackView)
        self.labelStackView.addArrangedSubview(self.fullNameLabel)
        self.labelStackView.addArrangedSubview(self.statusLabel)
        
        let topConstraint = self.infoStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingConstraint = self.infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        let trailingConstraint = self.infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        
        let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)
        
        self.buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 20)
       // self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)
        let buttonLeadingConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.infoStackView.leadingAnchor)
        let buttonTrailingConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
        let buttonBottomConstaraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let buttonHeightConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, buttonTopConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonBottomConstaraint, buttonHeightConstraint, imageViewAspectRatio
        ].compactMap({ $0 }))
    }
   /*
    @objc func didTapStatusButton() {
        if self.statusTextField.isHidden {
            self.addSubview(self.statusTextField)
            
            self.buttonTopConstraint?.isActive = false // Необходимо деактивировать констрейнт, иначе будет конфликт констрейнтов, и Auto Layout не сможет однозначно определить фреймы textField'а.
            
            let topConstraint = self.statusTextField.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 10)
            let leadingConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor)
            let trailingConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
            let heightTextFieldConstraint = self.statusTextField.heightAnchor.constraint(equalToConstant: 34) // Не указав высоту textField'а, получается неоднозначность/неопределенность констрейнтов. Auto Layout на основе этой неопределенности имеет множество решений (height для stackView, textField), выбирая оптимальное, а не необходимое, то есть вместо 34pts для textField'а растягивается stackView.
            self.buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.statusTextField.bottomAnchor, constant: 20)
            
            NSLayoutConstraint.activate([
                topConstraint, leadingConstraint, trailingConstraint, heightTextFieldConstraint, self.buttonTopConstraint
            ].compactMap({ $0 }))
            
        } else {
           // #warning("Убрать textField из вью!")
            self.statusTextField.removeFromSuperview()
            self.setStatusButton.setTitle("status", for: .normal)
        }
        self.delegate?.didTapStatusButton(textFieldIsVisible: self.statusTextField.isHidden) { [weak self] in
                self?.statusTextField.isHidden.toggle()
        }
    }
    */
}
