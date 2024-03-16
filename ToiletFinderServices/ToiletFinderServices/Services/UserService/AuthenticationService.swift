import Firebase

public class AuthenticationService: AuthenticationServiceProtocol {
    public static let shared = AuthenticationService()
    
    private init() {}
    
   public func addAuthStateListener(_ onChange: @escaping (User?) -> Void) {
        Auth.auth().addStateDidChangeListener { _, user in
            onChange(user)
        }
    }

    public func verifyCurrentUser(completion: @escaping (Bool, User?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(false, nil)
            return
        }

        user.getIDTokenForcingRefresh(true) { idToken, error in
            if let error = error {
                print("Error verifying user: \(error.localizedDescription)")
                if (error as NSError).code == AuthErrorCode.userNotFound.rawValue {
                    completion(false, nil)
                } else {
                    completion(false, nil)
                }
            } else {
                completion(true, user)
            }
        }
    }
    
    public func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error as NSError {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
