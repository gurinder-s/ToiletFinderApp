//
//  ForgotPasswordViewController.swift
//  ToiletFinder
//
//  Created by Gurinder Singh on 13/03/2024.
//

import UIKit
import ToiletFinderUI
import ToiletFinderServices
class ForgotPasswordViewController: UIViewController {
    // MARK: - Variables
    // MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Forgot Password", subtitle: "Reset your password")
    private let emailField = TLTextField(fieldType: .email)
    private let resetPasswordButton = TLButton(title: "Reset Password", hasbackground: true, fontSize: .large)
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.resetPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden=false
    }

    
    // MARK: - UI SETUP
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(resetPasswordButton)
        
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 11),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            
            self.resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 22),
            self.resetPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
        
        
        ])
    }
    
    // MARK: - Selectors
    
    @objc private func didTapForgotPassword(){
        
        // TODO: - Email verification 
        let email = self.emailField.text ?? ""
        
        if !Validator.isValidEmail(for: email){
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        FirebaseUserService.shared.forgotPassword(with: email) { [weak self] error in guard let self = self else {return}
            if let error = error{
                AlertManager.showErrorSendingPasswordResetAlert(on: self, with: error)
                return
            }
            AlertManager.showPasswordResetSentAlert(on: self)
        }
    }
    

}
