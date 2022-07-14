//
//  AddTodo.swift
//  ToDo
//
//  Created by AmirDiafi on 7/13/22.
//

import SwiftUI

struct AddTodo: View {
    @Environment(\.presentationMode) var presentationMode
    @State var todo: String = ""
    @State var isAlertPresented: Bool = false
    @State var isLoading: Bool = false
    @EnvironmentObject var viewModelList: ViewModelList
    @State var alertText: String = "Oops!, you should add at least 3 characters to your task 📝"
    let white = Color("white")
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("To do", text: $todo)
                    .frame(height: 50)
                    .padding(.leading, 10)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                Button(action: addItem) {
                    VStack {
                        if isLoading {
                            ProgressView()
                                .accentColor(white)
                        } else {
                            Text("Save".uppercased())
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(white)
                    
                }
            }
        }
        .alert(isPresented: $isAlertPresented, content: {
            customAlert(alertText: alertText)
        })
        .padding()
        .navigationTitle("Add Todo ✏️")
    }
    
    /// Add item to the data array
    func addItem() {
        isLoading = true
        if todo.count > 2 {
            viewModelList.addItem(newTodo: todo)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isLoading = false
            }
            presentationMode.wrappedValue.dismiss()
        }  else {
            isAlertPresented = true
            isLoading = false
        }
    }
}

/// A custom alert to handle if the input is appropriate
/// - Parameter alertText: the text string content
/// - Returns: Alert 's content to present with just a title
func customAlert(alertText: String) -> Alert {
    return Alert(title: Text(alertText))
}

struct AddTodo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTodo()
        }
        .preferredColorScheme(.dark)
    }
}
