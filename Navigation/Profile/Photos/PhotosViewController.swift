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

    private var collectionDataSource = [
       "c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10","c11", "c12", "c13", "c14", "c15","c16", "c17", "c18", "c19", "c20",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.title = "Photo Gallery"
        self.navigationItem.backButtonTitle = "Back"
        self.navigationController?.navigationBar.isHidden = false
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupView() {
        view.addSubview(self.collectionView)
        
        let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leftConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let rightConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, leftConstraint, rightConstraint, bottomConstraint
        ])
    }

    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
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
}
