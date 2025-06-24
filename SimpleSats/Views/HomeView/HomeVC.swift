//
//  HomeV.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 12.06.25.
//

import UIKit
import Combine

class HomeVC: UIViewController {
    
    private let viewModel = HomeVM()
    private var cancellable = Set<AnyCancellable>()
    
    private let backgroundGlow = HomeViewBackgroundGlow()
    private let actionButtonView = HomeActionButtons()
    private let tokensSectionView = TokensView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI(){
        setupGradientBackground()
        setupNavigationBar()
        setupBalanceSection()
        actionButtonSection()
        setupTokensSection()
        setupBindings()
    }
    
    
    private func setupGradientBackground() {
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
        let notificationVC = NotificationVC()
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
            availableBalanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            balanceAmountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            balanceAmountLabel.topAnchor.constraint(equalTo: availableBalanceLabel.bottomAnchor, constant: 8),
            
            metamaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            metamaskButton.topAnchor.constraint(equalTo: balanceAmountLabel.bottomAnchor, constant: 16),
            metamaskButton.heightAnchor.constraint(equalToConstant: 28)
            
        ])
    }
    
    private func actionButtonSection() {
        view.addSubview(actionButtonView)
        
        actionButtonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButtonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 162),
            actionButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            actionButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
    private func setupTokensSection() {
        view.addSubview(tokensSectionView)
        tokensSectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tokensSectionView.topAnchor.constraint(equalTo: actionButtonView.bottomAnchor, constant: 32),
            tokensSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tokensSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tokensSectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupBindings(){
        viewModel.$cryptoCoins
            .sink { [ weak self ] coins in
                guard let self = self else { return }
                print("HokeVC: \(coins.count)")
                self.tokensSectionView.configure(with: TokenSectionVM(coins: coins))
            }
            .store(in: &cancellable)
        
        viewModel.$errorMessage
            .compactMap{ $0 }
            .sink{[ weak self ] message in
                guard let self = self else { return }
                self.showAlert(title: "Error", message: message)
            }
            .store(in: &cancellable)
        
        viewModel.$isLoading
            .sink{ isLoading in
                if isLoading{
                    print("HomeVC: Loading")
                }
                else{
                    print("HomeVC: Loading complated")
                }
            }
            .store(in: &cancellable)
    }
    
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
 

}

