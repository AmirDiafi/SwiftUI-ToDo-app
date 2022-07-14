//
//  ListView.swift
//  ToDo
//
//  Created by AmirDiafi on 7/13/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModelList: ViewModelList
    
    var body: some View {
        ZStack{
            if viewModelList.list.isEmpty {
                EmptyList()
                    .transition(
                        AnyTransition.opacity.animation(.easeIn)
                    )
            } else {
                List {
                        ForEach(viewModelList.list, id: \.self , content: {item in
                            TodoItem(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        viewModelList.handleIsDone(item: item)
                                    }
                                }
                        })
                        .onDelete(perform: { indexSet in
                            viewModelList.deleteItem(indexSet: indexSet)
                        })
                        .onMove(perform: { indices, newOffset in
                            viewModelList.moveItem(from: indices, to: newOffset)
                        })
                }
                .transition(
                    AnyTransition.opacity.animation(.easeIn)
                )
            }
        }
        .padding(.top, 40)
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(
                "Add",
                destination: AddTodo()
            )
        )

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 12 Pro Max")
        .environmentObject(ViewModelList())
    }
}
