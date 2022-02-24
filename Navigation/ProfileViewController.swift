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
     //   view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Профиль"
    }
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
      //  button.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
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

//extension ViewController: ProfileHeaderViewProtocol {
//
//    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
//        self.heightConstraint?.constant = textFieldIsVisible ? 214 : 170
//
//        UIView.animate(withDuration: 0.3, delay: 0.0) {
//            self.view.layoutIfNeeded()
//        } completion: { _ in
//            completion()
//        }
//    }
//}
