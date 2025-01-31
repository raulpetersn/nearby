//
//  PlaceTableViewCell.swift
//  Nearby
//
//  Created by Rauls on 31/01/25.
//

import UIKit


class PlaceTableViewCell: UITableViewCell {
    
    static let identifier = "PlaceTableViewCell"
    
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.layer.borderColor = Colors.gray200.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 8
        return containerView
    }()
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.titleSM
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray600
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.textXS
        label.numberOfLines = 0
        label.textColor = Colors.gray500
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ticketIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.image = UIImage(named: "ticketIcon")
        return imageView
    }()
    
    let ticketDiscountLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.textXS
        label.numberOfLines = 0
        label.textColor = Colors.gray400
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(containerView)
        containerView.addSubview(itemImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(ticketIcon)
        containerView.addSubview(ticketDiscountLabel)
        setupConstrains()
    }
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            
            
            itemImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            itemImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            itemImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
//            itemImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8),
            itemImageView.widthAnchor.constraint(equalToConstant: 116),
            itemImageView.heightAnchor.constraint(equalToConstant: 184),
            
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            ticketIcon.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            ticketIcon.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 8),
            ticketIcon.widthAnchor.constraint(equalToConstant: 16),
            ticketIcon.heightAnchor.constraint(equalToConstant: 16),
            
            ticketDiscountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            ticketDiscountLabel.leadingAnchor.constraint(equalTo: ticketIcon.trailingAnchor, constant: 4)
            
        ])
    }
    
    
    func configure(with place: Place){
        itemImageView.image = UIImage(named: place.imageName)
        titleLabel.text = place.title
        descriptionLabel.text = place.description
        ticketDiscountLabel.text = "cupons disponíveis"
    }
    
}
