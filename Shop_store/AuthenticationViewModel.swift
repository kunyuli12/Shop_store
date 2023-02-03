//
//  AuthenticationViewModel.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/30.
//

import Foundation
import Firebase
import GoogleSignIn
import FirebaseAuth

class AuthenticationViewModel: NSObject, ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    let auth = Auth.auth()
    
    @Published var state: SignInState = .signedOut
    
    override init() {
        super.init()
        /*GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
              // Show the app's signed-out state.
                self.state = .signedOut
            } else {
              // Show the app's signed-in state.
                self.state = .signedIn
            }
          }*/
    }
    
    func authCreate(email:String,password:String,complete:@escaping()->Void){
        
        
        auth.createUser(withEmail: email, password: password) { authResult, error in
          // ...
            if error != nil{
              // Show the app's signed-out state.
                complete()
            } else {
              // Show the app's signed-in state.
                self.state = .signedIn
            }
        }
    }
    
    func authSignIn(email:String,password:String){
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // ...
            guard let result = authResult, error == nil else{
                return
            }
                    self!.state = .signedIn
        }
    }
    
    func signIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let signInConfig = GIDConfiguration.init(clientID: clientID)
        let popView = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: popView!) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }

            // If sign in succeeded, display the app's main content View.
            self.state = .signedIn
            user.authentication.do { authentication, error in
                    guard error == nil else { return }
                    guard let authentication = authentication else { return }

                    let idToken = authentication.idToken
                    // Send ID token to backend (example below).
                print("idToken is \(idToken)")
                print("clientID is \(clientID)")
                }
          }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        state = .signedOut
    }
}


