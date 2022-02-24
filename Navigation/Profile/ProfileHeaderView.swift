//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by alisa on 16.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var showStatusButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }

    private func setupView() {
        let view = self.loadViewFromXib()
        self.addSubview(view)
        
        self.nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        self.photoImageView.layer.cornerRadius = self.photoImageView.frame.height/2
        self.photoImageView.layer.borderColor = UIColor.white.cgColor
        self.photoImageView.layer.borderWidth = 3
        
        self.showStatusButton.layer.cornerRadius = self.showStatusButton.frame.height/4
        self.showStatusButton.layer.shadowOffset.height = 4
        self.showStatusButton.layer.shadowOffset.width = 4
        self.showStatusButton.layer.shadowColor = UIColor.black.cgColor
        self.showStatusButton.layer.shadowOpacity = 0.7
        
        self.showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        print(textField.text!)
    }

    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("ProfileHeaderView", owner: self, options: nil)?.first as? UIView else { return UIView() }
        
        return view
    }
}
