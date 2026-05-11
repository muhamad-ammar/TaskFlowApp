//
//  LoginView.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 07/05/2026.
//
import SwiftUI

struct LoginView: View {
    @State var userName: String = ""
    @State var password: String = ""
    @State var navigateToHome: Bool = false
    @State var navigateToSignUp: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("TaskFlowDemo")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.blue)
                Spacer()
                LoginForm
                Spacer()

            }
            .padding(.horizontal, 24)
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
            .navigationDestination(isPresented: $navigateToSignUp) {
                SignUpView()
            }

        }

    }

}

extension LoginView {
    var LoginForm: some View {
        return VStack(spacing: 16) {
            formTextField(label: "User Name", text: $userName)

            formTextField(label: "Password", text: $password, isSecure: true)

            Text("Password must be at least 6 letters")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)

            Button("Login") {
                print("Login Tapped with \(userName), \(password)")
                // Reseting Fields
                userName = ""
                password = ""
                navigateToHome = true

            }

            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
            .disabled(userName.isEmpty || password.count < 6)

            Button("Don't have an account? Register") {
                navigateToSignUp = true
            }
            .foregroundStyle(Color.blue)
        }
    }

}

func formTextField(label: String, text: Binding<String>, isSecure: Bool = false)
    -> some View
{
    return VStack {
        HStack {
            Text(label)
            Spacer()
        }
        .frame(alignment: .leading)
        if isSecure {
            SecureField("", text: text)
                .padding(10)  // Give the text some breathing room
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )

        } else {
            TextField("", text: text)
                .padding(10)  // Give the text some breathing room
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )

        }

    }

}

#Preview {
    LoginView()
}
