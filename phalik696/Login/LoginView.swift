import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var showingAlertRestPassword = false
    @State private var alertMessage = ""
    @State private var shouldNavigate = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Blue background
                Color.blue.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("phalik") // Replace with your actual image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    // Set the image width to be a fraction of the screen width
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.18)
                        .padding(.top, geometry.size.height * 0.01)
                    
                    Spacer(minLength: geometry.size.height * 0.05)
                    // White rounded background layout
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.white)
                    // Make the height take up the remaining space, while leaving some margin
                        .frame(width: geometry.size.width, height: geometry.size.height * 1)
                        .overlay(
                            VStack(spacing: 30) { // Use a smaller spacing value
                                
                                Text("כניסה למערכת")
                                    .font(.largeTitle)
                                    .fontWeight(.bold).padding(.top,30)
                                
                                TextField("אימייל", text: $email)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
                                    .multilineTextAlignment(.leading) // Correct for RTL
                                
                                SecureField("סיסמא", text: $password)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
                                    .multilineTextAlignment(.leading) // Correct for RTL
                           
                              
                                NavigationLink(destination: ContentView(), isActive: $shouldNavigate) { EmptyView() }

                                Button("התחבר") {
                                                  AuthService.shared.signIn(email: email, password: password) { result in
                                                      switch result {
                                                      case .success(let user):
                                                          self.shouldNavigate = true
                                                      case .failure(let error):
                                                          alertMessage = error.localizedDescription.description
                                                          showingAlert = true
                                                      }
                                                  }
                                              }
                                              .foregroundColor(.white)
                                              .padding()
                                              .background(Color.indigo)
                                              .cornerRadius(8)
                                              .font(.largeTitle)
                                              .fontWeight(.heavy)
                                              .alert(isPresented: $showingAlert) {
                                                  Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                                              }
                              

                                           NavigationLink(destination: RegistrationView()) {
                                                    Text("אין לך חשבון? צור כאן")
                                        .foregroundColor(.blue)
                                        .font(.largeTitle)
                                                }
                                
                              
                               
                                
                                Button("שכחת את הסיסמא?") {
                                    AuthService.shared.resetPassword(email: email) { result in
                                                                switch result {
                                                                case .success:
                                                                    alertMessage = "קישור לאיפוס הסיסמא נשלח לאיימל שלך"
                                                                    showingAlertRestPassword = true
                                                                case .failure(let error):
                                                                    alertMessage = error.localizedDescription
                                                                    showingAlertRestPassword = true
                                                                }
                                                            }
                                                        

                                }
                                .alert(isPresented: $showingAlertRestPassword) {
                                    Alert(title: Text("איפוס סיסמא"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                                }
                                .foregroundColor(.blue)
                                
                                .font(.largeTitle)
                                
                                Spacer(minLength: 50) // Provide some space at the bottom
                            }
                                .padding(.horizontal, 16)
                        )
                        .offset(y: geometry.size.height * -0.03) // Slightly move up
                    
                    Spacer()
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .environment(\.layoutDirection, .rightToLeft)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
