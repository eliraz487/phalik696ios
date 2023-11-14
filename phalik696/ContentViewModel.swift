//
//  ContentViewModel.swift
//  phalik696
//
//  Created by user247821 on 11/13/23.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
 

    init( ) {
  
    }

    func checkUserAuthentication() ->AnyView{
        return AnyView(Text("Not Implemented"))
    }

    func createMalfunction()->AnyView {
        return AnyView(Text("Not Implemented"))
    }

    func showMyMalfunctions()->AnyView {
        return AnyView(Text("Not Implemented"))
    }

    func showAllUsers() ->AnyView{
        return AnyView(Text("Not Implemented"))
    }

    func showAllMalfunctions() ->AnyView{
        return AnyView(Text("Not Implemented"))
    }

    func showMyUser() ->AnyView{
        return AnyView(Text("Not Implemented"))
    }

    func logout() ->AnyView {
        return AnyView(LoginView())
    }

    func performAction(for item: String)-> some View {
        switch item {
        case "create_malfunction":
            return createMalfunction()
        case "my_malfunction":
            return  showMyMalfunctions()
        case "all_users":
            return  showAllUsers()
        case "all_malfunctions":
            return showAllMalfunctions()
        case "my_user":
            return showMyUser()
        case "logout":
            AuthService.shared.signOut{ result in
                switch result {
                case .success:
                    print("User logged out")
                case .failure(let error):
                    print("Logout error: \(error)")
                }
            }
            return  logout()
        default:
            return AnyView(Text("Not Implemented"))
            
        }
    }
}

