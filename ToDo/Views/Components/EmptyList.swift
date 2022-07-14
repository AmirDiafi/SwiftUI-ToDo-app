//
//  EmptyList.swift
//  ToDo
//
//  Created by AmirDiafi on 7/14/22.
//

import SwiftUI

struct EmptyList: View {
    @State var animate: Bool = false
    let white = Color("white")
    let isOrientation = UIDevice.current.orientation.isPortrait
    
    var body: some View {
        ScrollView{
            // MARK: Empty message
            VStack {
                Text("There is no tasks yet.")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    .foregroundColor(Color.primary)
                Text("Are your productive person, you should add at least 3 tasks everyday to finish them \(String(describing: isOrientation))")
                    .font(.headline)
                    .foregroundColor(Color.secondary)
                    .padding(.bottom)
                
                if isOrientation{
                    Text("🧗🏻‍♂️")
                        .font(.system(size: 140))
                }
                
            } // End VStack - Message
            .padding()
            .multilineTextAlignment(.center)
                
            // MARK: Navigate to Add Item
            NavigationLink(destination: AddTodo()) {
                Text("Add")
                    .font(.headline)
                    .foregroundColor(white)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: 300)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .scaleEffect(animate ? 1.05 : 1)
                    .shadow(
                        color: Color.blue.opacity(0.6),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 30 : 10)
                    .offset(y: animate ? 0 : -2)
            }
        }
        .onAppear(perform: addAnimation)
    }
    
    private func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 1)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct EmptyList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyList()
                .navigationTitle("Title")
        }
        .preferredColorScheme(.dark)
    }
}
