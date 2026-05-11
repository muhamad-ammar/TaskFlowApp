//
//  AddTask.swift
//  TaskFlowDemo
//
//  Created by Muhammad Ammar on 07/05/2026.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var tasks: [String]
    @State var newTask: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 30) {
            Text("Add Task")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)

            VStack(spacing: 30) {
                TextField("Add Task here...", text: $newTask)
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
                        if !newTask.isEmpty {
                            tasks.append(newTask)

                            dismiss()
                            newTask = ""
                        }

                    }

                }

                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .disabled(newTask.isEmpty)
            }

        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    @Previewable @State var tasks = [
        "Go to Shoping",
        "Pay Bills",
        "Call Mom",
        "Call Dad",
        "Go to Gym",
        "Read Book",
    ]
    AddTaskView(tasks: $tasks)
}
