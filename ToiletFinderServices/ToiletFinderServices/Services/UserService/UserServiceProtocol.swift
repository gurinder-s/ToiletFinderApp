//
//  UserServiceProtocol.swift
//  ToiletFinderServices
//
//  Created by Gurinder Singh on 28/02/2024.
//

import Foundation
import ToiletFinderDomain
public protocol UserServiceProtocol{
     func registerUser(withEmail email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
}
