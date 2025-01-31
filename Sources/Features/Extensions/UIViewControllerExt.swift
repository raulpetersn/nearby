//
//  UIViewControllerExt.swift
//  Nearby
//
//  Created by Rauls on 29/01/25.
//

import Foundation
import UIKit


extension UIViewController {
    
     func setupContentViewToViewController(contentView: UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }
    
}
