//
//  HomeViewModel.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 12/05/2026.
//
import Foundation
import SwiftUI
internal import Combine

protocol HomeViewModelProtocol: ObservableObject {

    var tasks: [TaskModel] {get set}
    var showLogoutAlert: Bool {get set}
    var isLoading: Bool {get set}
    func fetchData() async
    func deleteTask(_ id: Int)
    func logout()
    
}
@MainActor
final class HomeViewModel: HomeViewModelProtocol {

    @Published var tasks: [TaskModel] = []
    @Published var showLogoutAlert: Bool = false
    @Published var isLoading: Bool = false
 
    let networkManager = NetworkManager()


    func fetchData() async {
        isLoading = true
        do {
           
            tasks = try await networkManager.fetchTasks()
        }
        catch {
            print(error)
        }
        isLoading = false
    }
    
    func logout() {
        print("User logged out")
    }
    func deleteTask(_ id: Int){
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks.remove(at: index)
        }
    }
}




