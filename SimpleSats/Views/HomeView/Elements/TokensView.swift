//
//  TokensView.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 15.06.25.
//

import UIKit
import Combine

class TokensView: UIView{
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tokens"
        label.font = .mediumLivvic(selfSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: 227, height: 162)
        layout.estimatedItemSize = .zero
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(TokenCardCollectionViewCell.self, forCellWithReuseIdentifier: TokenCardCollectionViewCell.reuseIdentifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private var viewModel: TokenSectionVM!
    
    private var cancellables = Set<AnyCancellable>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tokenViewBGColor
        layer.cornerRadius = 32
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        clipsToBounds = true
        setupUI()
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI(){
        addSubview(titleLabel)
        addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with viewModel: TokenSectionVM){
        self.viewModel = viewModel
        
        viewModel.$tokenCardViewModels
            .receive(on: DispatchQueue.main)
            .sink{[weak self] _ in
                guard let self = self else {return}
                self.collectionView.reloadData()
            }
            .store(in: &cancellables)
        
        collectionView.reloadData()
    }
    
}


extension TokensView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.tokenCardViewModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TokenCardCollectionViewCell.reuseIdentifier, for: indexPath) as? TokenCardCollectionViewCell else{
            fatalError("TokenCardView dont dequeue")
        }
        
        if let tokenVieModel = viewModel?.tokenCardViewModels[indexPath.item]{
            cell.configure(with: tokenVieModel)
        }
        
        return cell
    }
    
    
}

extension TokensView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 227, height: 162)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
