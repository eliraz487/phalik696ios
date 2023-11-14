import FirebaseAuth

class AuthService {
    static let shared = AuthService()

    // Sign In User
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let user = authResult?.user else {
                completion(.failure(NSError(domain: "AuthError", code: -1, userInfo: nil)))
                return
            }
            completion(.success(user))
        }
    }

    // Register User
    func register(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let user = authResult?.user else {
                completion(.failure(NSError(domain: "AuthError", code: -1, userInfo: nil)))
                return
            }
            completion(.success(user))
        }
    }

    // Check if User is Logged In
    func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
           do {
               try Auth.auth().signOut()
               completion(.success(()))
           } catch let signOutError as NSError {
               completion(.failure(signOutError))
           }
       }

       // Reset Password
    func resetPassword(email: String, completion: @escaping (Result<Void, Error>) -> Void) {
           // Check if the email is valid
           guard isValidEmail(email) else {
               completion(.failure(NSError(domain: "InvalidEmail", code: -1, userInfo: [NSLocalizedDescriptionKey: "בבבקשה הכנס כתובת איימל תקנית "])))
               return
           }

           Auth.auth().sendPasswordReset(withEmail: email) { error in
               if let error = error {
                   completion(.failure(error))
                   return
               }
               completion(.success(()))
           }
       }

       // Email validation method
       private func isValidEmail(_ email: String) -> Bool {
           let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
           return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
       }
}
