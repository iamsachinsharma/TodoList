//
//  NoItemsView.swift
//  TodoList
//
//  Created by Sachin Sharma on 07/07/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    @Binding var showSheet: Bool
    let SecAccentColor = Color("SecAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items...")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I thaink you should click the ADD button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Add something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? SecAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }.padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? SecAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: animate ? 30 : 10,
                            x: 0,
                            y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(30)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                          Animation.easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

//struct NoItemsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            NoItemsView()
//                .navigationTitle("title")
//        }
//    }
//}
