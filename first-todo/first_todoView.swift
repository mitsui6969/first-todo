//
//  first_todoView.swift
//  first-todo
//
//  Created by 三ツ井渚 on 2024/11/09.
//

import SwiftUI

struct ToDoItem {
    var isChecked: Bool
    var task: String
}

struct first_todoView: View {
    @State var newTask: String = "" // @State...値の更新を監視。通知が来たら自動でViewを再描画
    @State var todoLists: [ToDoItem] = [
        ToDoItem(isChecked: false, task: "読書する"),
        ToDoItem(isChecked: true, task: "掃除する"),
        ToDoItem(isChecked: false, task: "散歩する")
    ]
    
    var body: some View {
        VStack {
            Text("ToDoList")
                .font(.system(size: 30, weight: .bold, design: .default))
            HStack {
                TextField("タスクを入力してください", text: $newTask)
                    .textFieldStyle(.roundedBorder)
                    .padding(EdgeInsets(
                        top: 10,
                        leading: 20,
                        bottom: 10,
                        trailing: 15
                    ))
                Button("追加", action: {})
                    .padding(.trailing, 20)
            }
         ForEach(todoLists.indices, id:\.self) { index in  // ForEach...breakやreturnで抜け出せない繰り返し処理
                HStack { // HStack...横に並べて表示
                    Button(action: {
                        todoLists[index].isChecked.toggle()
                    }, label: {
                        Image(systemName:
                                todoLists[index].isChecked ? "checkmark.square":"square"
                        )
                        .imageScale(.large)
                        .foregroundStyle(.pink)
                    })
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
