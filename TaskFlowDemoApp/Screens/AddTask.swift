//
//  AddTask.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 07/05/2026.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var tasks: [TaskModel]
    @State var newTask: TaskModel = TaskModel(id: 0, title: "", isCompleted: false)
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 30) {
            Text("Add Task")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)

            VStack(spacing: 30) {
                TextField("Add Task here...", text: $newTask.title)
                    .autocorrectionDisabled(true)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                HStack {
                    Spacer()
                    Button("Save") {
                        print("Save Tapped with \(newTask) ")
                        if !newTask.title.isEmpty {
//                            newTask.id = generateId(title: newTask.title)
                            tasks.append(newTask)
                      
                            dismiss()
                            newTask = TaskModel(id: 0, title: "", isCompleted: false)
                        }

                    }

                }

                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .disabled(newTask.title.isEmpty)
            }

        }
        .padding(.horizontal, 24)
    }

    func generateId(title: String) -> String {

        let noSpaces = title.replacingOccurrences(of: " ", with: "")

        let randomDigits = Int.random(in: 10...99)

        return "\(noSpaces)\(randomDigits)"
    }
}
