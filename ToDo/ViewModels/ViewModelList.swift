//
//  ViewModel.swift
//  ToDo
//
//  Created by AmirDiafi on 7/13/22.
//

import Foundation

class ViewModelList: ObservableObject {
    @Published var list: [ListModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemesKey: String = "dataList"
    
    init() {
        getListItems()
    }
    
    func getListItems() {
        guard
            let dataList = UserDefaults.standard.data(forKey: itemesKey),
            let decodeDataList = try? JSONDecoder().decode([ListModel].self, from: dataList)
        else {return}
        list = decodeDataList
    }
    
    func deleteItem(indexSet: IndexSet) {
        list.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        list.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(newTodo: String) {
        list.insert(ListModel.init(text: newTodo, isDone: false), at: 0)
    }
    
    func handleIsDone(item: ListModel) {
        if let index = list.firstIndex(where: {$0.id == item.id}) {
            list[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        guard let encodeData = try? JSONEncoder().encode(list) else {return}
        UserDefaults.standard.setValue(encodeData, forKey: itemesKey)
    }
}
