//
//  ListView.swift
//  TodoList
//
//  Created by Sachin Sharma on 05/07/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var showSheet: Bool  = false
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .navigationTitle("ToDo List 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                Button("Add", action: {
                    showSheet.toggle()
                })
        )
        .sheet(isPresented: $showSheet) {
            VStack {
                HStack{
                    Text("Add an item ✍️")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }.padding().padding(.top)
                AddView()
            }.ignoresSafeArea()
                .presentationDetents([.fraction(0.4)])
                .presentationDragIndicator(.visible)
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


