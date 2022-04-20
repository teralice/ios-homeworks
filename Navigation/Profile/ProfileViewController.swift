//
//  ProfileViewController.swift
//  Navigation
//
//  Created by alisa on 08.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private var liked = false
    private var dataSource: [Posts.Post] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.sectionHeaderTopPadding = .leastNormalMagnitude
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.center = self.view.center
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "multiply")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.gray
        button.alpha = 0
        button.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()

    private lazy var viewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .right
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var jsonDecoder: JSONDecoder = {
        return JSONDecoder()
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.postView()
        
        self.fetchArticles { [weak self] articles in
            self?.dataSource = articles
            self?.tableView.reloadData()
        }
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupView() {
        self.view.addSubview(self.tableView)

        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }
    
    private func postView() {
        self.view.addSubview(self.postImageView)
        self.view.addSubview(self.backButton)
        self.postImageView.addSubview(self.authorLabel)
        self.postImageView.addSubview(self.descriptionLabel)
        self.postImageView.addSubview(self.likeLabel)
        self.postImageView.addSubview(self.viewLabel)
        
        self.postImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.postImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.postImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.postImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    
        self.descriptionLabel.bottomAnchor.constraint(equalTo: self.likeLabel.topAnchor, constant: -8).isActive = true
        self.descriptionLabel.trailingAnchor.constraint(equalTo: self.postImageView.trailingAnchor, constant: -8).isActive = true
        self.descriptionLabel.leadingAnchor.constraint(equalTo: self.postImageView.leadingAnchor, constant: 8).isActive = true
        
        self.likeLabel.leadingAnchor.constraint(equalTo: self.postImageView.leadingAnchor, constant: 8).isActive = true
        self.likeLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
        self.viewLabel.trailingAnchor.constraint(equalTo: self.postImageView.trailingAnchor, constant: -8).isActive = true
        self.viewLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
        self.authorLabel.leadingAnchor.constraint(equalTo: self.postImageView.leadingAnchor, constant: 8).isActive = true
        self.authorLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor, constant: -8).isActive = true
        
        self.backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
    }
    
    private func fetchArticles(completion: @escaping ([Posts.Post]) -> Void) {
        if let path = Bundle.main.path(forResource: "posts", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let posts = try self.jsonDecoder.decode(Posts.self, from: data)
                completion(posts.posts)
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            fatalError("Invalid filename/path.")
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            cell.likedDelegate = self

            if self.liked {
                self.dataSource[indexPath.row - 1].likes += 1
                self.liked.toggle()
            }
            cell.setup(with: returnPostModel(indexPath: indexPath))
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
            self.navigationItem.backButtonTitle = "Назад"
        } else {
            self.openPostView(tapedPost: true)
            self.setup(with: returnPostModel(indexPath: indexPath))
            self.dataSource[indexPath.row - 1].views += 1
            self.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}

extension ProfileViewController: TapLikedDelegate, Setupable {
    
    func returnPostModel(indexPath: IndexPath) -> PostModel {
        let article = self.dataSource[indexPath.row - 1]
        return PostModel(author: article.author, description: article.description, image: article.imageUI, likes: article.likes, views: article.views)
    }
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? PostModel else { return }
        
        self.postImageView.image = viewModel.image
        self.likeLabel.text = String(viewModel.likes) + " likes"
        self.viewLabel.text = String(viewModel.views + 1) + " views"
        self.authorLabel.text = viewModel.author
        self.descriptionLabel.text = viewModel.description
    }
    
    func tapLikedLabel() {
        self.liked.toggle()
        self.tableView.reloadData()
    }
    
    func openPostView(tapedPost: Bool) {
        self.postImageView.isHidden = tapedPost ? false : true
        self.backButton.alpha = tapedPost ? 1 : 0
        self.navigationController?.setNavigationBarHidden(tapedPost ? true : false, animated: false)
        self.navigationController?.tabBarController?.tabBar.isHidden = tapedPost ? true : false
    }
    
    @objc func tapBackButton() {
        self.openPostView(tapedPost: false)
    }
}
