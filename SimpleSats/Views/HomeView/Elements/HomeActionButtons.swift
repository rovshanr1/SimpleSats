//
//  HomeActionButtons.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 14.06.25.
//

import UIKit

class HomeActionButtons: UIView {
    private let sendActionPill: ActionPillView
    private let receiveActionPill: ActionPillView
    private let buyActionPill: ActionPillView
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        self.sendActionPill = ActionPillView(icon: UIImage(systemName: "paperplane.fill"), title: "Send")
        self.receiveActionPill = ActionPillView(icon: UIImage(systemName: "arrow.down.left"), title: "Receive")
        self.buyActionPill = ActionPillView(icon: UIImage(systemName: "dollarsign"), title: "Buy")
        
        super.init(frame: frame)
        setupViews()
       
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func setupViews(){

        stackView.addArrangedSubview(sendActionPill)
        stackView.addArrangedSubview(receiveActionPill)
        stackView.addArrangedSubview(buyActionPill)
        
        addSubview(stackView)
        
        sendActionPill.widthAnchor.constraint(equalToConstant: 60).isActive = true
        receiveActionPill.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buyActionPill.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        sendActionPill.tapAction = {
            print( "Send tapped" )
        }
        
        receiveActionPill.tapAction = {
            print( "Receive tapped" )
        }
        
        buyActionPill.tapAction = {
            print( "Buy tapped" )
        }

    }
    
    

}
