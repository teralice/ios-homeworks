//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by alisa on 05.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var likedDelegate: TapLikedDelegate?
    
    private var tapLikeGestureRecognizer = UITapGestureRecognizer()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()

    private lazy var viewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .right
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupGesture()
    }
    
    private func setupView() {
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.vStackView)
        self.vStackView.addArrangedSubview(self.authorLabel)
        self.vStackView.addArrangedSubview(self.postImageView)
        self.vStackView.addArrangedSubview(self.descriptionLabel)
        self.vStackView.addArrangedSubview(self.hStackView)
        self.hStackView.addArrangedSubview(self.likeLabel)
        self.hStackView.addArrangedSubview(self.viewLabel)
        
        let backViewConstraints = self.backViewConstraints()
        let vStackViewConstraints = self.vStackViewConstraints()
        let hStackViewConstraints = self.hStackViewConstraints()
        let authorConstraints = self.authorConstraints()
        let descriptionConstraints = self.descriptionConstraints()
        let likesConstraints = self.likesConstraints()
        let viewsConstraints = self.viewsConstraints()
        let imageConstraints = self.imageConstraints()

        NSLayoutConstraint.activate(backViewConstraints + vStackViewConstraints + hStackViewConstraints + authorConstraints + descriptionConstraints + likesConstraints + viewsConstraints + imageConstraints)
    }
    
    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    
    private func vStackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.vStackView.topAnchor.constraint(equalTo: self.backView.topAnchor)
        let leadingConstraint = self.vStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.vStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let bottomConstraint = self.vStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    
    private func authorConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.authorLabel.topAnchor.constraint(equalTo: self.vStackView.topAnchor, constant: 10)
        let leadingConstraint = self.authorLabel.leadingAnchor.constraint(equalTo: self.vStackView.leadingAnchor, constant: 10)
        let trailingConstraint = self.authorLabel.trailingAnchor.constraint(equalTo: self.vStackView.trailingAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint
        ]
    }
        
    private func imageConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.postImageView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor)
        let leadingConstraint = self.postImageView.leadingAnchor.constraint(equalTo: self.vStackView.leadingAnchor)
        let trailingConstraint = self.postImageView.trailingAnchor.constraint(equalTo: self.vStackView.trailingAnchor)
        let imageViewHeightAnchor = self.postImageView.heightAnchor.constraint(equalTo: self.postImageView.widthAnchor, multiplier: 1)

        return [
            topConstraint, leadingConstraint, trailingConstraint, imageViewHeightAnchor
        ]
    }
    
    private func descriptionConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16)
        let leadingConstraint = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.descriptionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint
        ]
    }
    
    private func hStackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.hStackView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 10)
        let leadingConstraint = self.hStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 10)
        let trailingConstraint = self.hStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -10)
        let bottomConstraint = self.hStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -10)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    
    private func likesConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.likeLabel.topAnchor.constraint(equalTo: self.hStackView.topAnchor)
        let leadingConstraint = self.likeLabel.leadingAnchor.constraint(equalTo: self.hStackView.leadingAnchor)
        let widthConstraint = self.likeLabel.widthAnchor.constraint(equalToConstant: 200)

        return [
            topConstraint, leadingConstraint, widthConstraint
        ]
    }
    
    private func viewsConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.viewLabel.topAnchor.constraint(equalTo: self.hStackView.topAnchor)
        let trailingConstraint = self.viewLabel.trailingAnchor.constraint(equalTo: self.hStackView.trailingAnchor)
        let widthConstraint = self.likeLabel.widthAnchor.constraint(equalToConstant: 200)

        return [
            topConstraint, trailingConstraint, widthConstraint
        ]
    }
    
    private func setupGesture() {
        self.tapLikeGestureRecognizer.addTarget(self, action: #selector(self.tapLiked(_:)))
        self.likeLabel.addGestureRecognizer(self.tapLikeGestureRecognizer)
    }
    
    @objc func tapLiked(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapLikeGestureRecognizer === gestureRecognizer else { return }
        likedDelegate?.tapLikedLabel()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.postImageView.image = nil
        self.descriptionLabel.text = nil
        self.likeLabel.text = nil
        self.viewLabel.text = nil
    }
    
}


extension PostTableViewCell: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? PostModel else { return }
        
        self.authorLabel.text = viewModel.author
        self.postImageView.image = viewModel.image
        self.descriptionLabel.text = viewModel.description
        self.likeLabel.text = "Likes: " + String(viewModel.likes)
        self.viewLabel.text = "Views: " + String(viewModel.views)
    }
}
