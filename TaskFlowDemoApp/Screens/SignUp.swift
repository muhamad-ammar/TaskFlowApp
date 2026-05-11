//
//  LoginView.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 07/05/2026.
//


//
//  LoginView.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 07/05/2026.
//
import SwiftUI

struct SignUpView: View {
    @State var userName: String = ""
    @State var password: String = ""
    @State var navigateToHome: Bool = false
    @State var navigateToLogin: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("TaskFlowDemo")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.blue)
                Spacer()
                SignUpForm
                Spacer()

            }
            .padding(.horizontal, 24)
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }

        }

    }

}

extension SignUpView {
    var SignUpForm: some View {
        return VStack(spacing: 16) {
            formTextField(label: "User Name", text: $userName)

            formTextField(label: "Password", text: $password, isSecure: true)

            Text("Password must be at least 6 letters")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)

            Button("Register") {
                print("Register Tapped with \(userName), \(password)")
                // Reseting Fields
                userName = ""
                password = ""
                navigateToHome = true

            }

            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
            .disabled(userName.isEmpty || password.count < 6)

            Button("Already have an account? Login") {
                navigateToLogin = true
            }
            .foregroundStyle(Color.blue)
        }
    }

}



#Preview {
    SignUpView()
}
