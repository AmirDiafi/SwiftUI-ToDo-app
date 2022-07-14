//
//  ToDoApp.swift
//  ToDo
//
//  Created by AmirDiafi on 7/13/22.
//

import SwiftUI

/*
 MVVM Architecture:
 
 Model => Data point
 View => UI
 ViewModel => Manages model for the view
 
 */

@main
struct ToDoApp: App {
    
    @StateObject var viewModelList: ViewModelList = ViewModelList()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(viewModelList)
        }
    }
}
