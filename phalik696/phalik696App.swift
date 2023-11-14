//
//  phalik696App.swift
//  phalik696
//
//  Created by user247821 on 11/9/23.
//

import SwiftUI

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct phalik696App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            if AuthService.shared.isUserLoggedIn() {
                            NavigationView {
                                ContentView() // Your main authenticated content view
                            }
                        } else {
                            NavigationView {
                                LoginView()
                            }
                        }
        }
    }
}
