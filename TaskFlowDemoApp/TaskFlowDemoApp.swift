//
//  TaskFlowDemoAppApp.swift
//  TaskFlowDemoApp
//
//  Created by Muhammad Ammar on 07/05/2026.
//

import SwiftUI

// Entry point of app
// Each app can only have one @main struct
@main
struct TaskFlowDemoApp: App {
    var body: some Scene {
        WindowGroup {
            // Login View
            LoginView()
        }
    }
}
