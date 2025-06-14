//
//  ActoinPillView.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 14.06.25.
//

import UIKit

class ActionPillView: UIView{
    private let iconImage = UIImageView()
    private let titleLable = UILabel()
    private let circleView = UIView()
    
    var tapAction: (() -> Void)?
    
    init(icon: UIImage?, title: String?, tapAction: (() -> Void)? = nil) {
        self.tapAction = tapAction
        super.init(frame: .zero)
        
        setupUI(icon: icon, title: title)
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func setupUI(icon: UIImage?, title: String?) {
        circleView.layer.cornerRadius = 30
        circleView.layer.borderColor = UIColor.white.cgColor
        circleView.layer.borderWidth = 1
        circleView.backgroundColor = .clear
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        iconImage.image = icon?.withRenderingMode(.alwaysTemplate)
        iconImage.tintColor = .buttonColorPink
        iconImage.contentMode = .scaleAspectFit
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        
        titleLable.text = title
        titleLable.textColor = .white
        titleLable.font = .lightLivvic(selfSize: 16)
        titleLable.textAlignment = .center
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(circleView)
        circleView.addSubview(iconImage)
        addSubview(titleLable)
        
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: 60),
            circleView.heightAnchor.constraint(equalToConstant: 60),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.topAnchor.constraint(equalTo: topAnchor),
            
            iconImage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 30),
            iconImage.heightAnchor.constraint(equalToConstant: 30),
            
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLable.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 8),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            titleLable.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
    }
    
    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
    }
    
    @objc private func handleTap(){
        tapAction?()
        
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.7
            
        }) { _ in
            UIView.animate(withDuration:0.1) {
                self.alpha = 1.0
            }
        }
    }
}
