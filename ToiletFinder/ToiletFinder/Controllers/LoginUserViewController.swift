//
//  LoginUserViewController.swift
//  ToiletFinder
//
//  Created by Gurinder Singh on 13/03/2024.
//

import UIKit
import ToiletFinderUI
class LoginUserViewController: UIViewController {
    
    // MARK - UI Components
    private let headerView = AuthHeaderView(title: "Sign In ", subtitle: "Sign in to your account")
    private let usernameField = TLTextField(coder: <#T##NSCoder#>)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        // Do any additional setup after loading the view.
    }
    
    
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    

}
