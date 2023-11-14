import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                
                                Text("הרשמה למערכת")
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
                                
                                Button("הירשם") {
                                    // Handle login action
                                }
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.indigo)
                                .cornerRadius(8)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                
                                
                                NavigationLink(destination:LoginView()){
                                    Text("כבר יש לך משתמש ? לחץ כאן")
                                        .foregroundColor(.blue)
                                        .font(.largeTitle)
                                }
                                  
                                 
                                    
                                
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
