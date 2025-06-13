//
//  HomeVC.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 12.06.25.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
        setupBalanceSection()
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
        notificationButton.tintColor = UIColor.buttonColorPink
        navigationItem.rightBarButtonItem = notificationButton
    }
    
    private func setupBalanceSection(){
        let availableBalanceLabel = UILabel()
        availableBalanceLabel.text = "Available balance"
        availableBalanceLabel.font = UIFont(name: "Livvic-Regular", size: 16)
        availableBalanceLabel.textColor = .lightGray
        availableBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(availableBalanceLabel)
        
        let balanceAmountLabel = UILabel()
        balanceAmountLabel.text = "$6,500"
        balanceAmountLabel.font = UIFont(name: "Livvic-SemiBold", size: 40)
        balanceAmountLabel.textColor = UIColor.pinkTextColor
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
    
    @objc private func handleMenu() {

    }
    
    @objc private func handleNotification() {
        let notificationVC = NotificationVC()
        navigationController?.pushViewController(notificationVC, animated: true)
    }

}

