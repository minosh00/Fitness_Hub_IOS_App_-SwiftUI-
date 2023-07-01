//
//  ContentView.swift
//  MyFitnessHub
//
//  Created by Minosh Imantha on 2023-06-15.
import SwiftUI

struct ContentView: View {
   
    
    var body: some View {
        TabView {
            ViewExerciseScreen()
                .tabItem {
                    Label("Exercise", systemImage: "figure.gymnastics")
                }
            
            AddExerciseScreen()
                .tabItem {
                    Label("Add Exercise", systemImage: "figure.strengthtraining.traditional")
                }
            
            BodyFactsScreen()
                .tabItem {
                    Label("Body Fact", systemImage: "figure.gymnastics")
                }
            
            AboutScreen()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
