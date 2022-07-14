//
//  ListModel.swift
//  ToDo
//
//  Created by AmirDiafi on 7/13/22.
//

import Foundation

/// Model for the Todo list
struct ListModel: Identifiable, Hashable, Codable {
    var id: String
    var text: String
    var isDone: Bool
    
    init(id: String = UUID().uuidString, text: String, isDone: Bool) {
        self.id = id
        self.text = text
        self.isDone = isDone
    }
    
    func updateCompletion() -> ListModel {
        return ListModel(id: id, text: text, isDone: !isDone)
    }
}
