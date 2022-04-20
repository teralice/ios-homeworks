//
//  PhotosViewController.swift
//  Navigation
//
//  Created by alisa on 16.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    private enum Constants {
        static let itemCount: CGFloat = 3
    }
    
    private var collectionDataSource = [
       "c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10","c11", "c12", "c13", "c14", "c15","c16", "c17", "c18", "c19", "c20",
    ]

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.center = self.view.center
        imageView.backgroundColor = .black
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.title = "Photo Gallery"
        self.navigationItem.backButtonTitle = "Back"
    }

    private func setupView() {
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.backView)
        self.view.addSubview(self.backButton)
        
        let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leftConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let rightConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        let topBackConstraint = self.backView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leftBackConstraint = self.backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let rightBackConstraint = self.backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomBackConstraint = self.backView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        let topBackButtonConstraint = self.backButton.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 16)
        let leftBackButtonConstraint = self.backButton.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            topConstraint, leftConstraint, rightConstraint, bottomConstraint, topBackConstraint, leftBackConstraint,rightBackConstraint, bottomBackConstraint, topBackButtonConstraint, leftBackButtonConstraint
        ])
    }

    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    private func openPhoto(tapedPhoto: Bool) {
        self.backView.isHidden = tapedPhoto ? false : true
        self.backButton.alpha = tapedPhoto ? 1 : 0
        self.collectionView.isHidden = tapedPhoto ? true : false
        self.collectionView.isScrollEnabled = tapedPhoto ? false : true
    }
    
    @objc func tapBackButton() {
        let indexPath = collectionView.indexPathsForSelectedItems!
        self.openPhoto(tapedPhoto: false)
        self.collectionView.reloadItems(at: indexPath)
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        cell.backgroundColor = .systemGray6
        let photos = collectionDataSource[indexPath.row]
        cell.photoImagesToGallery.image = UIImage(named: photos)
        cell.photoImagesToGallery.contentMode = .scaleAspectFill

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let spacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = UIImage(named: collectionDataSource[indexPath.row])
        self.backButton.superview?.bringSubviewToFront(self.backButton)
        self.view.layoutIfNeeded()

        UIView.animate(withDuration: 0.3) {
            self.backView.image = image
            self.openPhoto(tapedPhoto: true)
            self.view.layoutIfNeeded()
        }
    }
}
