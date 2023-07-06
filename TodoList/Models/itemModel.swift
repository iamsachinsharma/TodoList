//
//  itemModel.swift
//  TodoList
//
//  Created by Sachin Sharma on 06/07/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
