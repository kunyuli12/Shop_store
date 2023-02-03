//
//  AppDelegate.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/30.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        FirebaseApp.configure()
        return true
    }
}

