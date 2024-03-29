//
//  LoginUserViewController.swift
//  ToiletFinder
//
//  Created by Gurinder Singh on 13/03/2024.
//

import UIKit
import ToiletFinderUI
import ToiletFinderDomain
import ToiletFinderServices
class LoginUserViewController: UIViewController {
    
    // MARK - UI Components
    private let headerView = AuthHeaderView(title: "Sign In ", subtitle: "Sign in to your account")
    private let emailField = TLTextField(fieldType: .email)
    private let passwordField = TLTextField(fieldType: .password)
    private let signInButton = TLButton(title: "Sign In", hasbackground: true, fontSize: .large)
    private let newUserButton = TLButton(title: "New User? Create Account", fontSize: .med)
    private let forgotPasswordButton = TLButton(title: "Forgot Password", fontSize: .small)
    
    // MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        
        

    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
   
    // MARK - UI Setup
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        
        self.view.addSubview(signInButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        //Buttons
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            
            self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 22),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            
            self.newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor,constant: 22),
            self.newUserButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 55),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor,constant: 22),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    // MARK - Selectors
    @objc private func didTapSignIn(){
        let loginUserRequest = LoginUserRequest(_email: self.emailField.text ?? "", _password: self.passwordField.text ?? "")
        
        if !Validator.isValidEmail(for: loginUserRequest.email){
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        if !Validator.isPasswordValid(for: loginUserRequest.password){
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        FirebaseUserService.shared.signIn(with: loginUserRequest) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
        }
        
        
    }
    @objc private func didTapNewUser(){
        let viewController = RegisterUserViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @objc private func didTapForgotPassword(){
        let viewController = ForgotPasswordViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    

}
