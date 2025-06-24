//
//  Divider.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 21.06.25.
//

import UIKit

class Divider: UIView{
    init(
        color: UIColor = UIColor.white.withAlphaComponent(0.10),
        height: CGFloat = 1,
        isHorizontal: Bool = true
    ){
        super.init(frame: .zero)
        backgroundColor = color
        translatesAutoresizingMaskIntoConstraints = false
        if isHorizontal{
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: height)
            ])
        }
        else {
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: height)
                
            ])
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
