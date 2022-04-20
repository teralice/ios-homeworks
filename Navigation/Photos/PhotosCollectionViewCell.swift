//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by alisa on 05.04.2022.
//


import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var photoImagesToGallery: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(backView)
        self.backView.addSubview(photoImagesToGallery)
        
        let backViewTop = backView.topAnchor.constraint(equalTo: contentView.topAnchor)
        let backViewLeading = backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let backViewTrailing = backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let backViewBottom = backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        let photoImagesToGalleryCenterX = photoImagesToGallery.centerXAnchor.constraint(equalTo: backView.centerXAnchor)
        let photoImagesToGalleryCenterY = photoImagesToGallery.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        let photoImagesToGalleryHeight = photoImagesToGallery.heightAnchor.constraint(equalTo: backView.heightAnchor)
        let photoImagesToGalleryWidth = photoImagesToGallery.widthAnchor.constraint(equalTo: backView.widthAnchor)
        
        NSLayoutConstraint.activate([
            backViewTop, backViewLeading, backViewTrailing, backViewBottom, photoImagesToGalleryHeight, photoImagesToGalleryCenterX, photoImagesToGalleryCenterY, photoImagesToGalleryWidth
        ].compactMap({ $0}))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
