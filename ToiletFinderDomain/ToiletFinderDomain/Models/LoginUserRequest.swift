//
//  loginUserRequest.swift
//  ToiletFinderDomain
//
//  Created by Gurinder Singh on 16/03/2024.
//

import Foundation
import Foundation
public struct LoginUserRequest{
    
    private let _email: String
    private let _password: String
    
    
    public var email: String { _email }
    public var password: String { _password }
    
    public init(_email: String, _password: String) {
        self._email = _email
        self._password = _password
    }
}
