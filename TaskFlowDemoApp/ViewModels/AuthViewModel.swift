//
//  AuthViewModel.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 12/05/2026.
//

import Foundation
internal import Combine

protocol AuthViewModelProtocol: ObservableObject {
    var isAuthicated: Bool { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    
    func checkExistingSession()
    func login(userName: String, password: String) async
    func logout()
}
@MainActor
class AuthViewModel: AuthViewModelProtocol {
    @Published var isAuthicated: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let authService = AuthService()
    private let keyChain = KeyChainManager.shared
    
    func checkExistingSession() {
        let token = keyChain.load(key: "auth_token")
        
        isAuthicated = token != nil
    }
    
    func login(userName: String, password: String) async {
        isLoading = true
        
        // Used defer to always stop loading (even on error)
        defer { isLoading = false }
        
        do {
            let token = try await authService.login(userName: userName, password: password)
            let status = keyChain.save(token.token, forKey: "auth_token")
            if status {
                isAuthicated = true
            }
            else {
                errorMessage = "Failed to save token"
            }
        }
        catch{
         print(error)
        }
    }
    
    func logout() {
        keyChain.delete(key: "auth_token")
        isAuthicated = false
        errorMessage = ""
        
        
    }
    
}
