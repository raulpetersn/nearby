//
//  HomeView.swift
//  Nearby
//
//  Created by Rauls on 31/01/25.
//

import Foundation
import MapKit

class HomeView: UIView {
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private let filterScrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isUserInteractionEnabled = true
        return scrollView
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray100
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private let dragIndicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray300
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.textMD
        label.textColor = Colors.gray600
        label.text = "Explore locais perto de você"
        return label
    }()
    
    
    private let filterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = true
        stackView.distribution = .fill
        return stackView
    }()
    
    
    private let placesTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(PlaceTableViewCell.self, forCellReuseIdentifier: PlaceTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var containerTopConstrains: NSLayoutConstraint?
    
    private func setupUI() {
        addSubview(mapView)
        addSubview(filterScrollView)
        addSubview(containerView)
        
        filterScrollView.addSubview(filterStackView)
        
        containerView.addSubview(dragIndicatorView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(placesTableView)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.65),
            
            filterScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            filterScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            filterScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterScrollView.heightAnchor.constraint(equalToConstant: 86),
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            
            filterStackView.topAnchor.constraint(equalTo: filterStackView.topAnchor),
            filterStackView.leadingAnchor.constraint(equalTo: filterStackView.leadingAnchor),
            filterStackView.trailingAnchor.constraint(equalTo: filterStackView.trailingAnchor),
            filterStackView.bottomAnchor.constraint(equalTo: filterStackView.bottomAnchor),
            filterStackView.heightAnchor.constraint(equalTo: filterStackView.heightAnchor),
            
        ])
        
        containerTopConstrains = containerView.topAnchor.constraint(equalTo: mapView.bottomAnchor,constant: -16)
        containerTopConstrains?.isActive = true
        
        NSLayoutConstraint.activate([
            dragIndicatorView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            dragIndicatorView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dragIndicatorView.heightAnchor.constraint(equalToConstant: 4),
            dragIndicatorView.widthAnchor.constraint(equalToConstant: 80),
            
            descriptionLabel.topAnchor.constraint(equalTo: dragIndicatorView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            placesTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            placesTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            placesTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            placesTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
        ])
        
    }
}
