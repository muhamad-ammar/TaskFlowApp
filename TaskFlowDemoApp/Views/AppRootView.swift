//
//  AppRootView.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 12/05/2026.
//
import SwiftUI

struct AppRootView: View {
    @StateObject private var authVM = AuthViewModel()

    var body: some View {
        Group {
            if authVM.isAuthicated {
                HomeView()
            } else {
                LoginView()
            }
        }
        .onAppear{
            authVM.checkExistingSession()
        }
        .environmentObject(authVM)
    }
}
