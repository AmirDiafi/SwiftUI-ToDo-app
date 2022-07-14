//
//  TodoItem.swift
//  ToDo
//
//  Created by AmirDiafi on 7/13/22.
//

import SwiftUI

struct TodoItem: View {
    let white = Color("white")
    let black = Color("black")
    let gray = Color("gray")
    
    @State var item: ListModel
    var body: some View {
        HStack{
            Image(systemName: item.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(
                    item.isDone ? Color(.systemGreen) : Color(.systemBlue))
            Text(item.text)
                .overlay(
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: item.isDone == true ? 2 : 0)
                )
        }
        .font(.title3)
        .padding(.vertical, 5)
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var itemOne: ListModel = ListModel.init(text: "Hey test one", isDone: false)
    static var itemTwo: ListModel = ListModel.init(text: "Hey test two", isDone: true)
    static var previews: some View {
        Group {
            TodoItem(item: itemOne)
                .preferredColorScheme(.dark)
            TodoItem(item: itemTwo)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 400, height: 200))
    }
}
