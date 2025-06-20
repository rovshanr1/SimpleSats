//
//  TokenCardView.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 14.06.25.
//

import UIKit

class TokenCardView: UIView {
    
    private let iconCircleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tokenNameLabel: UILabel = {
        let label = UILabel()
        label.font = .semiBoldLivvic(selfSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.font = .lightLivvic(selfSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let graphView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumLivvic(selfSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let changeValueLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumLivvic(selfSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeRange30mButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("30m", for: .normal)
        button.titleLabel?.font = .mediumLivvic(selfSize: 12)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .tokenTimeSeriesColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let timeRange1hButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1h", for: .normal)
        button.titleLabel?.font = .mediumLivvic(selfSize: 12)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.tokenTimeSeriesColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let timeRange1dButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1d", for: .normal)
        button.titleLabel?.font = .mediumLivvic(selfSize: 12)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.tokenTimeSeriesColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let timeRangeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var selectedTimeRangeButton: UIButton!
    
    private let hDivider = Divider(height: 1, isHorizontal: true)
    private let vDivider = Divider(height: 1, isHorizontal: false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .tokenBackgroundColor
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubview(iconCircleView)
        addSubview(tokenNameLabel)
        addSubview(percentageLabel)
        addSubview(graphView)
        addSubview(priceLabel)
        addSubview(changeValueLabel)
        addSubview(hDivider)
        addSubview(vDivider)
        
        timeRangeStackView.addArrangedSubview(timeRange30mButton)
        timeRangeStackView.addArrangedSubview(timeRange1hButton)
        timeRangeStackView.addArrangedSubview(timeRange1dButton)
        addSubview(timeRangeStackView)
        
        NSLayoutConstraint.activate([
            iconCircleView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            iconCircleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconCircleView.widthAnchor.constraint(equalToConstant: 12),
            iconCircleView.heightAnchor.constraint(equalToConstant: 12),
            
            tokenNameLabel.leadingAnchor.constraint(equalTo: iconCircleView.trailingAnchor, constant: 8),
            tokenNameLabel.centerYAnchor.constraint(equalTo: iconCircleView.centerYAnchor),
            
            percentageLabel.topAnchor.constraint(equalTo: iconCircleView.bottomAnchor, constant: 8),
            percentageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            hDivider.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: 12),
            hDivider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hDivider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hDivider.heightAnchor.constraint(equalToConstant: 1),
            
            graphView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            graphView.centerYAnchor.constraint(equalTo: tokenNameLabel.centerYAnchor),
            graphView.widthAnchor.constraint(equalToConstant: 60),
            graphView.heightAnchor.constraint(equalToConstant: 30),
            
            priceLabel.topAnchor.constraint(equalTo: tokenNameLabel.bottomAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            changeValueLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            changeValueLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            
            timeRangeStackView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16),
            timeRangeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timeRangeStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            timeRangeStackView.heightAnchor.constraint(equalToConstant: 30),
            timeRangeStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)

        ])
        
    }
    
    
    func configure(with viewModel: TokenCardViewModel){
        iconCircleView.backgroundColor = viewModel.iconColor
        tokenNameLabel.text = viewModel.tokenName
        percentageLabel.text = viewModel.percentageChange
        percentageLabel.textColor = viewModel.isPositiveChange ? .systemGreen : .systemRed
        priceLabel.text = viewModel.price
        changeValueLabel.text = viewModel.absoluteChangeAndPercentageText
        
    }
    
    @objc private func timeRangeButtonTapped(_ sender: UIButton) {
        selectTimeRangeButton(sender)
        // Logic for updating data according to the selected time interval will be added here
        // For example: It can be notified to a parent VM using the delegate pattern.
        print("Selected Time Range: \(sender.titleLabel?.text ?? "")")
    }
    
    private func selectTimeRangeButton(_ selectedButton: UIButton) {
        
        [timeRange30mButton, timeRange1hButton, timeRange1dButton].forEach { button in
            button.setTitleColor(.lightGray, for: .normal)
            button.backgroundColor = .clear
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.tokenTimeSeriesColor.cgColor
        }
        
        
        selectedButton.setTitleColor(.white, for: .normal)
        selectedButton.backgroundColor = .tokenTimeSeriesColor
        selectedButton.layer.borderWidth = 0
        selectedButton.layer.borderColor = UIColor.clear.cgColor
        
        self.selectedTimeRangeButton = selectedButton
    }

}
