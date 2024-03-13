//
//  FirebaseUserService.swift
//  ToiletFinderServices
//
//  Created by Gurinder Singh on 28/02/2024.
//

import Foundation
import ToiletFinderDomain
import FirebaseAuth
public class FirebaseUserService: UserServiceProtocol {
    public init() {}    
    public func registerUser(withEmail email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let user = authResult?.user else {
                completion(.failure(NSError(domain: "UserService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"])))
                return
            }
            let userModel = UserModel(uid: user.uid, email: user.email, displayName: user.displayName)
            completion(.success(userModel))
        }
    }
}
