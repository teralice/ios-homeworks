//
//  ProfileViewController.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileHeaderView: ProfileHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = true
        self.navigationItem.title = "Профиль"
        profileHeaderView.backgroundColor = .lightGray
        self.view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = self.view.frame
    }
}
