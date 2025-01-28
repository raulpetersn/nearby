//
//  Colors.swift
//  Nearby
//
//  Created by Rauls on 28/01/25.
//

import Foundation
import UIKit

class NearbyFlowController {
    
    private var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    func start() -> UINavigationController? {
        let startViewController = SplashViewController()
        self.navigationController = startViewController
        return startViewController
    }
    
}
