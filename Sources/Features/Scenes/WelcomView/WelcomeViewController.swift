//
//  WelcomeViewController.swift
//  Nearby
//
//  Created by Rauls on 29/01/25.
//

import UIKit


class WelcomeViewController: UIViewController {
    
    let contentView: WelcomeView
    
    init(contentView: WelcomeView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        self.view.addSubview(contentView)
        view.backgroundColor = Colors.gray100
        setupConstrains()
    }
    
    private func setupConstrains() {
        self.setupContentViewToViewController(contentView: contentView)
    }
}
