//
//  CustomProfileButton.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 01.07.25.
//

import UIKit

class SettingsButton: UIButton {
    
    let gradient = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    
    private func setupButton(){
    
        setTitle("Settings", for: .normal)
        titleLabel?.font = .semiBoldLivvic(selfSize: 16)
        setTitleColor(.white, for: .normal)
   
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "chevron.right")
        config.imagePlacement = .trailing
        config.imagePadding = 5
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        config.baseBackgroundColor = .clear
        self.configuration = config
        
        
        layer.cornerRadius = 18
        clipsToBounds = true
        
        gradient.colors = [
            UIColor.gradientBMagenta!.cgColor,
            UIColor.gradientBPurple!.cgColor,
            UIColor.gradientBBlue!.cgColor
        ]
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        layer.insertSublayer(gradient, at: 0)
        
    }
}
