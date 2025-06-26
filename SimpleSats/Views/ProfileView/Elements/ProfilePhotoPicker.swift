//
//  ProfilePhotoPicker.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 26.06.25.
//

import UIKit
protocol ProfilePhotoPickerDelegate: AnyObject{
    func didTapPickerPhoto()
}

class ProfilePhotoPicker: UIView {
    
    weak var delegate: ProfilePhotoPickerDelegate?
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderColor = UIColor.purpleBB?.cgColor
        imageView.layer.borderWidth = 3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setupView(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func imageTapped(){
        delegate?.didTapPickerPhoto()
    }
    
    func setImage(_ image: UIImage){
        imageView.image = image
    }
}


