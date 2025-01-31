//
//  HomeViewController.swift
//  Nearby
//
//  Created by Rauls on 31/01/25.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    private var places: [Place] = []
    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
    }
    
    
}
