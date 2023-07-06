//
//  ListView.swift
//  TodoList
//
//  Created by Sachin Sharma on 05/07/23.
//

import SwiftUI

struct ListView: View {
    @Environment(\.dismiss) var dismiss
    @State var items: [String] = [
        "This is the first title!",
        "This is the second!",
        "Third!"
    ]
    
    @State var showingSheet: Bool = false
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .navigationTitle("ToDo List 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


