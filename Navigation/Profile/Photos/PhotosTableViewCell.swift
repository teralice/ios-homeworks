//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by alisa on 14.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let itemCount: CGFloat = 4
    }

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var photosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "2")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "3")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var fourImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "4")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func photoSize(for width: CGFloat) -> CGFloat {
        let neededWidth = width - 3 * photosStackView.spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        print("vvvvv \(width)")
        print("hihihih \(neededWidth)")
        print("alyalya \(itemWidth)")
        return itemWidth
    }
    
    private func setupView() {
        //self.contentView.addSubview(self.backView)
        self.photosStackView.addArrangedSubview(self.firstImageView)
        self.photosStackView.addArrangedSubview(self.secondImageView)
        self.photosStackView.addArrangedSubview(self.thirdImageView)
        self.photosStackView.addArrangedSubview(self.fourImageView)
        
        self.backView.addSubview(self.photosStackView)
        
       // self.backView.addSubview(self.scrollView)
        self.backView.addSubview(self.titleLabel)
        self.backView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.backView)
        
        let backViewConstraints = self.backViewConstraints()
        let titleConstraints = self.titleConstraints()
        let iconConstraints = self.iconConstraints()
        let photosStackViewConstraints = self.photosStackViewConstraints()
        let photosImageViewConstraints = self.photosImageViewConstraints()
        
        
        NSLayoutConstraint.activate(backViewConstraints + titleConstraints + iconConstraints + photosStackViewConstraints + photosImageViewConstraints)
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
    
    private func titleConstraints() -> [NSLayoutConstraint] {
        
        let topConstraint = self.titleLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12)
        let leadingConstraint = self.titleLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        
        return [
            topConstraint, leadingConstraint
        ]
    }
    
    private func iconConstraints() -> [NSLayoutConstraint] {
        
        let trailingConstraint = self.iconImageView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12.0)
        let centerYConstraint = self.iconImageView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor)
        let heightConstraint = self.iconImageView.heightAnchor.constraint(equalTo: self.titleLabel.heightAnchor)
        let widthConstraint = self.iconImageView.widthAnchor.constraint(equalTo: self.iconImageView.heightAnchor, multiplier: 1.0)
        
        
        return [
            trailingConstraint, centerYConstraint, heightConstraint, widthConstraint
        ]
    }
    
    private func photosStackViewConstraints() -> [NSLayoutConstraint] {
        
        let topConstraint = self.photosStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12)
        let leadingConstraint = self.photosStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let trailingConstraint = self.photosStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
        let bottomConstraint = self.photosStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12)
        
        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    
    private func photosImageViewConstraints() -> [NSLayoutConstraint] {
        let size = self.photoSize(for: self.contentView.frame.width)
        
        let firstWidthConstraint = self.firstImageView.widthAnchor.constraint(equalToConstant: size)
        let firstHeightConstraint = self.firstImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor)
        
        let secondWidthConstraint = self.secondImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor)
        let secondHeightConstraint = self.secondImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor)

        let thirdWidthConstraint = self.thirdImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor)
        let thirdHeightConstraint = self.thirdImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor)

        let fourWidthConstraint = self.fourImageView.widthAnchor.constraint(equalTo: firstImageView.widthAnchor)
        let fourHeightConstraint = self.fourImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor)
        
        return [
            firstWidthConstraint, firstHeightConstraint, secondWidthConstraint, secondHeightConstraint, thirdWidthConstraint, thirdHeightConstraint, fourWidthConstraint, fourHeightConstraint
        ]
    }
    
}
