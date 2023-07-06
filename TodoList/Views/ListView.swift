//
//  ListView.swift
//  TodoList
//
//  Created by Sachin Sharma on 05/07/23.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            Text("Hi")
        }
        .navigationTitle("ToDo List 📋")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
