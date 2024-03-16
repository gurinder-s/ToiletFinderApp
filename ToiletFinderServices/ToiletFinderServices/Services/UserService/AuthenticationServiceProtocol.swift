import FirebaseAuth
protocol AuthenticationServiceProtocol {
    func addAuthStateListener(_ onChange: @escaping (User?) -> Void)
    func verifyCurrentUser(completion: @escaping (Bool, User?) -> Void)
}
