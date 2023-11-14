
import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
       @State private var selectedItem: String? = nil
      let items = ["create_malfunction", "my_malfunction", "all_users", "all_malfunctions", "my_user", "logout"]
      
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    Color.blue
                        .edgesIgnoringSafeArea(.top)
                    
                    Image("phalik") // Replace with your actual image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.15)
                        .padding(.bottom, geometry.size.height * 0.02)
                }
                .frame(height: geometry.size.height * 0.15)
             
                ScrollView {
                    VStack(spacing: 0) {
                        Spacer(minLength: geometry.size.height*0.03)
                  
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: geometry.size.height * 0.02) {
                                              ForEach(items, id: \.self) { item in
                                                  NavigationLink(destination: ContentViewModel().performAction(for: item), tag: item, selection: $selectedItem) {
                                                      CardView(imageName: item, size: geometry.size)
                                                  }
                                                  .buttonStyle(PlainButtonStyle()) // To prevent the button style of NavigationLink
                                              }
                                          }
                                          .padding(.horizontal, geometry.size.width * 0.05)
                        Spacer(minLength: geometry.size.height * 0.05) // Space between the top view and the grid
                      
                        
                        HStack {
                            Image("tikshuv") // Replace with your actual image name
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.05)
                            
                            Text("פותח ע״י פלחיק 696") // Replace with your actual text
                                .font(.largeTitle)
                                .frame(height: geometry.size.height * 0.05)
                            
                            Image("phalik") // Replace with your actual image name
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.05)
                        }
                        .padding(.bottom, geometry.size.height * 0.02)
                    }
                }
            }
        }
        .statusBar(hidden: true)
    }
    
    
    func checkUserAuthentication() {
     
    }

    func createMalfunction() {
        // Implement the logic to create a malfunction
        // This might involve setting some state to show a new view or form
    }

    func showMyMalfunctions() {
        // Implement the logic to show the user's malfunctions
        // This might involve navigating to a new screen with a list of malfunctions
    }

    func showAllUsers() {
        // Implement the logic for a manager to view all users
        // This might involve setting some state to show a new view or list
    }

    func showAllMalfunctions() {
      
    }

    func showMyUser() {
    
    }

    func logout() {
        NavigationView {
            LoginView() // Your main authenticated content view
        }
    }

    func performAction(for item: String) {
        switch item {
        case "create_malfunction":
            createMalfunction()
        case "my_malfunction":
            showMyMalfunctions()
        case "all_users":
            showAllUsers()
        case "all_malfunctions":
            showAllMalfunctions()
        case "my_user":
            showMyUser()
        case "logout":
            logout()
        default:
            break
        }
    }

}

