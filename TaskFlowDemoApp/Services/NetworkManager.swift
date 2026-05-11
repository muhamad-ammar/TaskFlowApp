//
//  NetworkManager.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 11/05/2026.
//

import Foundation

class NetworkManager {
    func fetchTasks() async throws -> [TaskModel] {

        guard
            let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        else { throw URLError(.badURL) }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw URLError(.badServerResponse)
        }

        let tasks = try JSONDecoder().decode([TaskModel].self, from: data)

        print("Data received!")
        return tasks

    }

}
