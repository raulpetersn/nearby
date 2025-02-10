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
    
    func start() -> UINavigationController? {
        let contentView = SplashView()
        let startViewController = SplashViewController(contentView: contentView, delegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
    
}

extension NearbyFlowController: SplashFlowDelegate {
    func decideNavigateFlow() {
        let contentView = WelcomeView()
        let welcomeViewController = WelcomeViewController(contentView: contentView)
        welcomeViewController.flowDelegate = self
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

extension NearbyFlowController: WelcomeFlowDelegate {
    
    func goToHome() {
        let homeController = HomeViewController()
        navigationController?.pushViewController(homeController, animated: true)
    }
}
