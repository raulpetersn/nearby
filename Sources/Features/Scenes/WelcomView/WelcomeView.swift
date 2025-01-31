//
//  WelcomeView.swift
//  Nearby
//
//  Created by Rauls on 29/01/25.
//

import UIKit

class WelcomeView: UIView {
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Boas vindas ao Nearby!"
        label.font = Typography.titleXL
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tenha cupons de vantagem para usar em seus estabelecimentos favoritos."
        label.font = Typography.textMD
        label.numberOfLines = 0
        return label
    }()
    
    private let subTextForTips: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Veja como funciona:"
        label.font = Typography.textMD
        label.numberOfLines = 0
        return label
    }()
    
    
    private let tipsStackView: UIStackView = {
        let tipsStackView = UIStackView()
        tipsStackView.axis = .vertical
        tipsStackView.spacing = 16
        tipsStackView.translatesAutoresizingMaskIntoConstraints = false
        return tipsStackView
    }()
    
    
    private let startButton: UIButton = {
        let btnStart = UIButton()
        btnStart.setTitle("Começar", for: .normal)
        btnStart.backgroundColor = Colors.greenBase
        btnStart.setTitleColor(Colors.gray100, for: .normal)
        btnStart.layer.cornerRadius = 8
        btnStart.translatesAutoresizingMaskIntoConstraints = false
        btnStart.titleLabel?.font = Typography.action
        return btnStart
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTipsView()
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(subTextForTips)
        addSubview(tipsStackView)
        addSubview(startButton)
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            subTextForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            subTextForTips.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            subTextForTips.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            tipsStackView.topAnchor.constraint(equalTo: subTextForTips.bottomAnchor, constant: 24),
            tipsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            tipsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 56)
            
        ])
        
    }
    
    private func setupTipsView() {
        guard let mapIcon = UIImage(named: "mapIcon") else { return }
        guard let qrCodeIcon = UIImage(named: "qrcodeIcon") else { return }
        guard let ticketIcon = UIImage(named: "ticketIcon") else { return }
        
        let tip1 = TipsView(
            icon: mapIcon,
            title: "Encontre estabelecimentos próximos",
            description: "Veja locais perto de você que sao parceiros da Nearby")
        
        let tip2 = TipsView(
            icon: qrCodeIcon,
            title: "Ative o cupom com QR Code",
            description: "Escaneie o código no estabelecimento para usar o benefício")
        
        let tip3 = TipsView(
            icon: ticketIcon,
            title: "Garanta vantagens perto de você",
            description: "Ative cupons onde estiver, em diferentes tipos de estabelecimento")
        
        tipsStackView.addArrangedSubview(tip1)
        tipsStackView.addArrangedSubview(tip2)
        tipsStackView.addArrangedSubview(tip3)
    }
    
}
