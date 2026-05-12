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
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                if authVM.isLoading {
                    VStack {
                        ProgressView()
                    }
                    .background(Color.black.opacity(0.3))
                }
                VStack {

                    Text("TaskFlowDemo")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.blue)
                    Spacer()
                    LoginForm
                    Spacer()
                }
            }

        }
        .padding(.horizontal, 24)

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
                Task {
                    await authVM.login(userName: userName, password: password)
                }

            }

            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
            .disabled(
                userName.isEmpty || password.count < 6 || authVM.isLoading
            )

            if let error = authVM.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Button("Don't have an account? Register") {
                // Signup flow — implemented in Step 6
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
