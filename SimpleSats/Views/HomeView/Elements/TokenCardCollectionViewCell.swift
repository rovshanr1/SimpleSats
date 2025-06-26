//
//  TokenCardCollectionViewCell.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 19.06.25.
//

import UIKit

class TokenCardCollectionViewCell: UICollectionViewCell{
    static let reuseIdentifier = "TokenCardCollectionViewCell"
    
    private let tokenCardView = TokenCardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(){
        contentView.addSubview(tokenCardView)
        tokenCardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tokenCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tokenCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tokenCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tokenCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    func configure(with viewModel: TokenCardViewModel){
        tokenCardView.configure(with: viewModel)
    }
}
