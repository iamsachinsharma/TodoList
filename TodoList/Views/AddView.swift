//
//  AddView.swift
//  TodoList
//
//  Created by Sachin Sharma on 06/07/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment (\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    @EnvironmentObject var listVIewModel: ListViewModel
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Add an item...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.gray).opacity(0.3))
                    .cornerRadius(10)
                Button {
                    saveBtnPressed()
                } label: {
                    Text("SAVE")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                }
            }.padding(14)
                .alert(alertTitle, isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
        }
    }
    
    func saveBtnPressed(){
        if textIsValid() {
            listVIewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert.toggle()
        }
    }
    
    func textIsValid()-> Bool{
        if textFieldText.isEmpty {
            alertTitle = "Feild can't be empty😨😰😱"
            return false
        }
        if textFieldText.count < 3 {
            alertTitle = "Item must be at least 3 characters long"
            return false
        }
        return true
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(){
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
