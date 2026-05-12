//
//  Home.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 07/05/2026.
//
import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    @State var navigateToAddTask: Bool = false
    @StateObject private var vm = HomeViewModel()
    
    
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
                    vm.showLogoutAlert = true
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
            if vm.isLoading {
                Spacer()
                ProgressView()
                Spacer()

            }
            else if vm.tasks.isEmpty {
                Spacer()
                // Empty View
                Text("No Tasks Exists")
                Spacer()
            }
            else {

                List(vm.tasks, id: \.id) { task in
                    HStack {
                        Text(task.title)
                            .font(.title3)
                        Spacer()
                        Image(systemName: "trash")
                            .font(.title3)
                            .foregroundColor(.red)
                            .onTapGesture {
                                vm.deleteTask(task.id)
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
            await vm.fetchData()
            
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 20)
        .navigationDestination(isPresented: $navigateToAddTask) {
            AddTaskView(tasks: $vm.tasks)
        }
        .alert("Logout", isPresented: $vm.showLogoutAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Logout", role: .destructive) {
                vm.logout()
                dismiss()
            }
        } message: {
            Text("Are you sure you want to logout?")
        }
    }
    


 
    
   
}


