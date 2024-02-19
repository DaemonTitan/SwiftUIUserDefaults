//
//  ToDoListUserDefaultsApp.swift
//  ToDoListUserDefaults
//
//  Created by Tony Chen on 9/2/2024.
//

import SwiftUI

/*
 Model - data point
 View - UI
 ViewModel - manages models for view
 */

@main
struct ToDoListUserDefaultsApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    @State var showSplashScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplashScreen {
                    SplashScreenView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    NavigationStack {
                        ListView()
                    }
                    .environmentObject(listViewModel)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.spring) {
                        self.showSplashScreen = false
                    }
                }
            }
        }
    }
}
