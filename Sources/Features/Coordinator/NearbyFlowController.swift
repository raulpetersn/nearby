//
//  NearbyFlowController.swift
//  Nearby
//
//  Created by Rauls on 28/01/25.
//

import Foundation
import UIKit

class NearbyFlowController {
    
    private var navigationController: UINavigationController?
    
    init() {
        
    }
    
    func start() -> UINavigationController? {
        let contentView = SplashView()
//        let startViewController = SplashViewController(contentView: contentView, delegate: self)
        let startViewController = HomeViewController()
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
    
    
    
    
}

extension NearbyFlowController: SplashFlowDelegate {
    func decideNavigateFlow() {
        let contentView = WelcomeView()
        let welcomeViewController = WelcomeViewController(contentView: contentView)
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
