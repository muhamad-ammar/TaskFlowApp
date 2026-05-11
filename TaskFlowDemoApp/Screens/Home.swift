//
//  Home.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 07/05/2026.
//
import SwiftUI

struct HomeView: View {
    @State var navigateToAddTask: Bool = false
    @State var tasks: [TaskModel] = []
    @State var showLogoutAlert: Bool = false
    @State var isLoading: Bool = false
    @Environment(\.dismiss) var dismiss
    let networkManager = NetworkManager()
    var body: some View {

        VStack {
            HStack {
                Text("My Tasks")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundStyle(Color.blue)
                Spacer()
                Button(action: {
                    print("Add Task")
                    navigateToAddTask = true
                }) {
                    Image(systemName: "plus")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                Button(action: {
                    showLogoutAlert = true
                }) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(Color.red, lineWidth: 1)
                        )
                        .foregroundColor(.red)
                }
            }
            if isLoading {
                Spacer()
                // Empty View
                ProgressView()
                Spacer()

            }
            else if tasks.isEmpty {
                Spacer()
                // Empty View
                Text("No Tasks Exists")
                Spacer()
            }
            else {

                List(tasks, id: \.id) { task in
                    HStack {
                        Text(task.title)
                            .font(.title3)
                        Spacer()
                        Image(systemName: "trash")
                            .font(.title3)
                            .foregroundColor(.red)
                            .onTapGesture {
                                deleteTask(task.id)
                            }
                    }
                    .padding(10)


                }
                .listStyle(.plain)
                .padding(.horizontal, -10)
                .listRowSeparator(.visible)

            }

            Spacer()
        }
        .task {
            isLoading = true
           await fetchData()
            isLoading = false
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 20)
        .navigationDestination(isPresented: $navigateToAddTask) {
            AddTaskView(tasks: $tasks)
        }
        .alert("Logout", isPresented: $showLogoutAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Logout", role: .destructive) {
                logout()
            }
        } message: {
            Text("Are you sure you want to logout?")
        }
    }
    
    func fetchData() async {
        do {
            tasks = try await networkManager.fetchTasks()
//            print
        }
        catch {
            print(error)
        }
    }

    
    func deleteTask(_ id: Int){
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks.remove(at: index)
        }
    }
    
    
    func logout() {
        print("User logged out")
        dismiss()
    }
}


