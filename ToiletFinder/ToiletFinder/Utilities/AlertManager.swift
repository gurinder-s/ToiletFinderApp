//
//  AlertManager.swift
//  ToiletFinder
//
//  Created by Gurinder Singh on 13/03/2024.
//

import UIKit

class AlertManager{
    private static func showBasicAlert(on vc: UIViewController, with title: String, and message: String?){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
        
    }
}


// MARK - Show Validation Alerts
extension AlertManager{
    public static func showInvalidEmailAlert(on vc:UIViewController){
        self.showBasicAlert(on: vc, with: "Invalid Email", and: "Please enter a valid email.")
    }
    
    public static func showInvalidPasswordAlert(on vc:UIViewController){
        self.showBasicAlert(on: vc, with: "Invalid Password", and: "Please enter a valid password.")
    }
    
    public static func showInvalidUsernameAlert(on vc:UIViewController){
        self.showBasicAlert(on: vc, with: "Invalid Username", and: "Please enter a valid username.")
    }
}
    
// MARK - Show Registration Alerts
extension AlertManager{
    public static func showRegistrationErrorAlert(on vc:UIViewController){
        self.showBasicAlert(on: vc, with: "Unknown Registration error", and: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc:UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Registration error", and: "\(error.localizedDescription)")
    }
        
   
}

// MARK - Sign In Error Alerts
extension AlertManager{
    public static func showSignInErrorAlert(on vc:UIViewController){
        self.showBasicAlert(on: vc, with: "Unknown Sign in error", and: nil)
    }
    
    public static func showSignInErrorAlert(on vc:UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Sign in error", and: "\(error.localizedDescription)")
    }
        
   
}

// MARK - Sign Out Error Alerts
extension AlertManager{
    
    public static func showSignOutErrorAlert(on vc:UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Sign out error", and: "\(error.localizedDescription)")
    }
        
   
}

// MARK - Forgot Password  Alerts
extension AlertManager{
    public static func showPasswordResetSentAlert(on vc:UIViewController){
        self.showBasicAlert(on: vc, with: "Password reset sent!", and: nil)
    }
    public static func showErrorSendingPasswordResetAlert(on vc:UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Error Sending Password Reset", and: "\(error.localizedDescription)")
    }
        
   
}

// MARK - Fetching User error
extension AlertManager{
    
    public static func showUnknownFetchingUserErrorAlert(on vc:UIViewController){
        self.showBasicAlert(on: vc, with: "Unknown Fetching User Error!", and: nil)
    }
    public static func showFetchingUserErrorAlert(on vc:UIViewController, with error: Error){
        self.showBasicAlert(on: vc, with: "Error Fetching User", and: "\(error.localizedDescription)")
    }
        
   
}
