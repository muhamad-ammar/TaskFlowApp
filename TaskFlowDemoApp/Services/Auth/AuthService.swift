//
//  AuthService.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 12/05/2026.
//

class AuthService {
    func login(userName: String, password: String) async throws -> AuthToken {
        return AuthToken(token: "123456", userId: "\(Int.random(in: 1...10))")
    }
    func Logout() {
        
    }
}
