//
//  MetamaskButton.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 13.06.25.
//

import UIKit

class MetamaskButton: UIButton {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton(){
        var config = UIButton.Configuration.filled()
        
        let circleShape = createCircleShape(diameter: 8, color: UIColor.white.withAlphaComponent(0.8))
        config.image = circleShape
        config.imagePlacement = .leading
        config.imagePadding = 6
        
        let attributedTitleString = NSMutableAttributedString(string: "metamask")
        
        if let chevronImage = UIImage(systemName: "chevron.down") {
            let tintChevron = chevronImage.withTintColor(.white, renderingMode: .alwaysOriginal)
            let textAttachment = NSTextAttachment()
            textAttachment.image = tintChevron
            textAttachment.bounds = CGRect(x: 0, y: 0, width: 8, height: 6)
            
            attributedTitleString.append(NSAttributedString(string: " "))
            attributedTitleString.append(NSAttributedString(attachment: textAttachment))

        }
        
        config.attributedTitle = AttributedString(attributedTitleString)
        
        config.baseForegroundColor = .white
        config.background.backgroundColor = UIColor.purpleBBLO
        config.background.strokeColor = .purpleBB
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16)

        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont(name: "Livvic-Medium", size: 16)
            return outgoing
        }
        
        self.configuration = config
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func createCircleShape(diameter: CGFloat, color: UIColor) -> UIImage? {
        let size = CGSize(width: diameter, height: diameter)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { cxt in
            color.setFill()
            UIBezierPath(ovalIn: CGRect(origin: .zero, size: size)).fill()
        }
    }
}
