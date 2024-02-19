//
//  SplashScreenView.swift
//  ToDoListUserDefaults
//
//  Created by Tony Chen on 12/2/2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color(UIColor.accent).ignoresSafeArea()
            VStack {
                Image(systemName: "checkmark.rectangle.stack.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                Text("Do Something...")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            
        }
    }
}

#Preview {
    SplashScreenView()
}
