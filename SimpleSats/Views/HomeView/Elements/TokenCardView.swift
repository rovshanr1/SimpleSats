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
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumLivvic(selfSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeRemaining30mButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("30m", for: .normal)
        button.titleLabel?.font = .mediumLivvic(selfSize: 12)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .tokenTimeSeriesColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let timeRemaining1hButton: UIButton = {
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
    
    
    private let timeRemaining1dmButton: UIButton = {
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
    
    private let timeRemainingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        //TODO: SetupUI
    }
}
