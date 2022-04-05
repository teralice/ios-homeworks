//
//  PostViewController.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    private lazy var itemButton: UIBarButtonItem = {
           let button = UIBarButtonItem()
           return button
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = FeedViewController.post.title
        self.itemButton.image = UIImage(systemName: "exclamationmark.circle")
    }
}
