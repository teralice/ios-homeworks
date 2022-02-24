//
//  ViewController.swift
//  Navigation
//
//  Created by alisa on 03.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupView() {
        
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.nextButton)
        
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        self.nextButton.setTitle("next", for: .normal)
        let nextButtonLeadingConstraint = self.nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        let nextButtonTrailingConstraint = self.nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        let nextButtonBottomConstaraint = self.nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint, nextButtonLeadingConstraint, nextButtonTrailingConstraint, nextButtonBottomConstaraint].compactMap({ $0 }))
    }
}
