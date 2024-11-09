//
//  first_todoView.swift
//  first-todo
//
//  Created by 三ツ井渚 on 2024/11/09.
//

import SwiftUI

struct first_todoView: View {
    var todoLists: [(isChecked: Bool, task: String)] = [
        (isChecked: false, task: "読書する"),
        (isChecked: true, task: "掃除する"),
        (isChecked: false, task: "散歩する")
    ]
    
    var body: some View {
        VStack {
            Text("ToDoList")
                .font(.system(size: 30, weight: .bold, design: .default))
            ForEach(todoLists.indices, id:\.self) { index in
                HStack {
                    Image(systemName:
                            todoLists[index].isChecked ? "checkmark.square":"square"
                    )
                    Text(todoLists[index].task)
                }
                .padding(.top, 1)
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment : .leading)
            }
        }
            Spacer()
    }
}
