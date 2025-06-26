//
//  BackgroundGlow.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 13.06.25.
//

import UIKit

class BackgroundGlow: UIView {
    
    private var gradientLayers: [CAGradientLayer] = []
    
    override init(frame: CGRect){
        super .init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func setupView(){
        backgroundColor = UIColor.appBackgroundColor
        setupGradientGlows()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrames()
    }
    
    private func setupGradientGlows(){

        let glow1 = createGlowGradient(colors: [
            UIColor(red: 0.4, green: 0.2, blue: 0.9, alpha: 0.3).cgColor,
            UIColor(red: 0.3, green: 0.2, blue: 0.6, alpha: 0.2).cgColor,
            UIColor.clear.cgColor,
        ])
        
//        let glow2 = createGlowGradient(
//            colors: [
//                UIColor(red: 0.5, green: 0.3, blue: 0.8, alpha: 0.14).cgColor,
//                UIColor(red: 0.3, green: 0.1, blue: 0.6, alpha: 0.25).cgColor,
//                UIColor.clear.cgColor
//            ]
//        )
        
        let glow2 = createGlowGradient(
            colors: [
                UIColor(red: 0.5, green: 0.3, blue: 0.8, alpha: 0.1).cgColor,
                UIColor(red: 0.3, green: 0.2, blue: 0.6, alpha: 0.1).cgColor,
                UIColor.clear.cgColor
            ]
        )
 
        
        gradientLayers = [glow1, glow2, /*glow3*/]
        
        for gradient in gradientLayers{
            layer.addSublayer(gradient)
        }
    }
    
    private func createGlowGradient(colors: [CGColor]) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.type = .radial
        return gradient
        
    }
    
    private func updateGradientFrames(){
        guard gradientLayers.count >= 2 else { return }
        
        let width = bounds.width
        let height = bounds.height
        
        gradientLayers[0].frame = CGRect(
            x: -width * 0.3,
            y: height * 0.2,
            width: width * 0.8,
            height: height * 0.6
        )
        
//        gradientLayers[1].frame = CGRect(
//            x: width * 0.4,
//            y: height * 0.4,
//            width: width * 0.9,
//            height: height * 0.7
//        )
//        
        gradientLayers[1].frame = CGRect(
            x: width * 0.5,
            y: -height * 0.1,
            width: width * 0.6,
            height: height * 0.4
        )
    }
}
