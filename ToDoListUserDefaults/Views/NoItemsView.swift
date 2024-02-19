//
//  NoItemsView.swift
//  ToDoListUserDefaults
//
//  Created by Tony Chen on 12/2/2024.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        VStack {
            Text("There are no items!")
                .font(.title)
                .fontWeight(.bold)
            Text("Are you a productive person? I think you should click the add button and add a bunch of tiems to your to do list")
                .padding(.bottom, 20)
            NavigationLink {
                AddView()
            } label: {
                HStack {
                    Image(systemName: "plus.app.fill")
                    Text("Add something")
                }
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : Color.accent)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
            }
            .padding(.horizontal, animate ? 30 : 50)
            .shadow(
                color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                radius: animate ? 30 : 10,
                x: 0,
                y: animate ? 50 : 30)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -7 : 0)

        }
        .multilineTextAlignment(.center)
        .padding(40)
        .frame(maxWidth: 400, maxHeight: .infinity)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(
                Animation
                    .easeOut(duration: 2.0)
                    .repeatForever()
            
            
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
}
