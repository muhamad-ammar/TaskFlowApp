# 📱 TaskFlowDemoApp

A production-style iOS task management application built using **Swift** and **SwiftUI**, following **MVVM architecture principles**.  
This project demonstrates real-world mobile engineering concepts including API integration, authentication, secure storage, and scalable app design.

---

## 🚀 Features

- 🔐 Authentication system (Login / SignUp)
- 🔑 Secure token storage using Keychain
- 🌐 REST API integration using async/await
- 📦 JSON decoding with Codable models
- 🧠 MVVM architecture (View / ViewModel / Service separation)
- 📝 Full CRUD functionality for tasks
- 💾 Local state management
- ⏳ Loading and error handling states
- 🎯 Clean and scalable SwiftUI structure

---

## 🧱 Architecture

The project follows **MVVM (Model-View-ViewModel)** architecture:

```
View → ViewModel → Service → API
```

### 📌 Layers:

- **View**
  - SwiftUI screens
  - UI only (no business logic)

- **ViewModel**
  - Handles state
  - Manages API responses
  - Business logic layer

- **Service (NetworkManager / AuthService)**
  - Handles API calls
  - Networking logic
  - Data decoding

- **Model**
  - Codable data structures
  - Represents API responses

---

## 🔐 Authentication Flow

- User signs up / logs in
- Server (or mock service) returns token
- Token is securely stored in **Keychain**
- App checks token on launch:
  - If token exists → Navigate to Home
  - If not → Show Login screen
- Logout clears stored token

---

## 🌐 Networking

- Built using `URLSession`
- Async/await for modern concurrency
- Codable for JSON parsing
- Centralized `NetworkManager`

---

## 🧠 Task Management

Supports full CRUD operations:

- ➕ Add Task
- 📋 View Tasks
- 🗑 Delete Task

Tasks are managed via ViewModel for clean separation.

---

## 📦 Project Structure

```
TaskFlowDemoApp/
│
├── Models/
│   └── TaskModel.swift
│
├── Views/
│   ├── LoginView.swift
│   ├── SignUpView.swift
│   ├── HomeView.swift
│   └── AddTaskView.swift
│
├── ViewModels/
│   └── HomeViewModel.swift
│
├── Services/
│   ├── NetworkManager.swift
│   └── AuthService.swift
│
└── TaskFlowDemoApp.swift
```

---

## ⚙️ Tech Stack

- Swift 5
- SwiftUI
- MVVM Architecture
- URLSession
- Codable
- async/await
- Keychain
- iOS 16+

---

## 🚀 Roadmap

### Day 3
- MVVM refactor
- Move logic from Views → ViewModels

### Day 4
- Authentication system
- Keychain integration

### Day 5
- CRUD + persistence

### Day 6
- UI/UX improvements

### Day 7
- Final polish & evaluation readiness

---

## 👨‍💻 Author

Muhammad Ammar
