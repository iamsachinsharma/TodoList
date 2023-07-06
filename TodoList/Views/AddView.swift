//
//  AddView.swift
//  TodoList
//
//  Created by Sachin Sharma on 06/07/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    TextField("Add an item...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(.gray).opacity(0.3))
                        .cornerRadius(10)
                    Button {
                        //
                    } label: {
                        Text("SAVE")
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                        
                    }
                }
            }.padding(14)
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(){
            AddView()
        }
    }
}
