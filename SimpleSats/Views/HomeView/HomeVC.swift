//
//  HomeV.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 12.06.25.
//

import UIKit

class HomeV: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
        setupBalanceSection()
        actionButtonSection()
    }

    
    
    private func setupGradientBackground() {
        let backgroundGlow = HomeViewBackgroundGlow()
        view.addSubview(backgroundGlow)
        backgroundGlow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundGlow.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundGlow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundGlow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundGlow.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func setupNavigationBar() {
        let menuImage = UIImage(systemName: "line.horizontal.3")
        let menuButton = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = menuButton
        
        let notificationImage = UIImage(systemName: "bell.fill")
        let notificationButton = UIBarButtonItem(image: notificationImage, style: .plain, target: self, action: #selector(handleNotification))
        notificationButton.tintColor = .buttonColorPink
        navigationItem.rightBarButtonItem = notificationButton
    }
    
    @objc private func handleMenu() {

    }
    
    @objc private func handleNotification() {
        let notificationVC = NotificationV()
        navigationController?.pushViewController(notificationVC, animated: true)
    }
    
    private func setupBalanceSection(){
        let availableBalanceLabel = UILabel()
        availableBalanceLabel.text = "Available balance"
        availableBalanceLabel.font = .regularLivvic(selfSize: 16)
        availableBalanceLabel.textColor = .lightGray
        availableBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(availableBalanceLabel)
        
        let balanceAmountLabel = UILabel()
        balanceAmountLabel.text = "$6,500"
        balanceAmountLabel.font = .semiBoldLivvic(selfSize: 40)
        balanceAmountLabel.textColor = .pinkTextColor
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(balanceAmountLabel)
        
        let metamaskButton = MetamaskButton()
        view.addSubview(metamaskButton)
        
        
        NSLayoutConstraint.activate([
            availableBalanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            availableBalanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            
            balanceAmountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            balanceAmountLabel.topAnchor.constraint(equalTo: availableBalanceLabel.bottomAnchor, constant: 8),
            
            metamaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            metamaskButton.topAnchor.constraint(equalTo: balanceAmountLabel.bottomAnchor, constant: 16),
            metamaskButton.heightAnchor.constraint(equalToConstant: 28)
            
        ])
    }
    
    private func actionButtonSection() {
        let actionButtonView = HomeActionButtons()
        view.addSubview(actionButtonView)
    
        actionButtonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actionButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButtonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 236),
            actionButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            actionButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
 

}

