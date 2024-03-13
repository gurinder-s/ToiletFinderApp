//
//  UserModel.swift
//  ToiletFinderDomain
//
//  Created by Gurinder Singh on 28/02/2024.
//

import Foundation
public struct UserModel {
    let uid: String
    let email: String?
    let displayName: String?
    // Consider placeholders for future expansion such as profile pictures, favorite locations, etc.
    
    public init(uid: String, email: String?, displayName: String?) {
           self.uid = uid
           self.email = email
           self.displayName = displayName
       }
}
