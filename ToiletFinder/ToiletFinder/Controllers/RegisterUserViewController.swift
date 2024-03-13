//
//  RegisterUserViewController.swift
//  ToiletFinder
//
//  Created by Gurinder Singh on 13/03/2024.
//

import UIKit
import ToiletFinderUI
class RegisterUserViewController: UIViewController {
    
    // MARK - UI Components
    private let headerView = AuthHeaderView(title: "Sign Up ", subtitle: "Create your account")
    private let usernameField = TLTextField(fieldType: .username)
    private let emailField = TLTextField(fieldType: .email)
    private let passwordField = TLTextField(fieldType: .password)
    
    private let signUpButton = TLButton(title: "Sign Up", hasbackground: true, fontSize: .large)
    private let signInButton = TLButton(title: "Already have an account? Sign in.", hasbackground: false, fontSize: .med)
    private let termsTextView : UITextView = {
        let tv = UITextView()
        tv.text = "By creating an account, You agree to our terms & conditions and you acknowledge you have read our privacy policy"
        tv.backgroundColor = .clear
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    // MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        

    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
   
    // MARK - UI Setup
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        
        self.view.addSubview(signUpButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(signInButton)
        
        
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        //Buttons
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            
            self.emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor,constant: 22),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            
            self.signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 22),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            
            self.termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor,constant: 6),
            self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
           
            self.signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor,constant: 11),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.85),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            
            
        ])
    }
    
    // MARK - Selectors
    @objc private func didTapSignUp(){
        
    }
    @objc private func didTapSignIn(){
       
    }
   

    

}
