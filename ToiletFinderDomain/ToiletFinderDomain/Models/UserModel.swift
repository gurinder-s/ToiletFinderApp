//
//  UserModel.swift
//  ToiletFinderDomain
//
//  Created by Gurinder Singh on 28/02/2024.
//

import Foundation
public struct UserModel {
    private let _uid: String
    private let _username: String
    private let _email: String
    private let _password: String
    private let _displayName: String
    
    public var uid: String { _uid }
    public var username: String { _username }
    public var email: String { _email }
    public var password: String { _password }
    public var displayName: String { _displayName }

    public init(uid: String, email: String, displayName: String, username: String, password: String) {
        self._uid = uid
        self._email = email
        self._displayName = displayName
        self._username = username
        self._password = password
    }
}

