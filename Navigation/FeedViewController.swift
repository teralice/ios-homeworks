//
//  FeedViewController.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    static let post = Post(title: "Публикация")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Лента"
        self.navigationItem.backButtonTitle = "Назад"
        self.setupButton()
    }
    
    private func setupButton() {
        self.continueButton.backgroundColor = .systemPurple
        self.continueButton.layer.cornerRadius = 15
        self.continueButton.clipsToBounds = true
        self.continueButton.setTitleColor(.white, for: .normal)
        self.continueButton.setTitle("Далее", for: .normal)
    }
}
