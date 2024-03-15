//
//  RegisterUserRequest.swift
//  ToiletFinderDomain
//
//  Created by Gurinder Singh on 15/03/2024.
//

import Foundation
public struct RegisterUserRequest{
    private let _username: String
    private let _email: String
    private let _password: String
    
    public var username: String { _username }
    public var email: String { _email }
    public var password: String { _password }
    
    public init(_username: String, _email: String, _password: String) {
        self._username = _username
        self._email = _email
        self._password = _password
    }
}
