//
//  KeyChainManager.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 12/05/2026.
//
import Security
import Foundation

class KeyChainManager {
    static let shared = KeyChainManager()
    private init(){
    }
    
    private let tokenKey = "auth_token"
    
    func save(_ value: String, forKey key: String) -> Bool {
        let data = value.data(using: .utf8)
        
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data!
        ]
        
        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == errSecSuccess
        
    }
    
    func load(key: String) -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        guard status == errSecSuccess else {
            // errSecItemNotFound is a normal case -> return nil
            return nil
        }

        guard let data = item as? Data else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }
    
    func delete(key: String) {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        
        SecItemDelete(query as CFDictionary)
    }
    
}
