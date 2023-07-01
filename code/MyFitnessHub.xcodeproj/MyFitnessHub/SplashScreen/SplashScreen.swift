//
//  SplashScreen.swift
//  MyFitnessHub
//
//  Created by Minosh Imantha on 2023-06-15.
//




import SwiftUI
import CoreData

var totalViews = 2

struct SplashScreen: View {
    @AppStorage("currentView") var currentView = 1
    
    var body: some View {
        
        if currentView == 1 {
            WalkthroughScreen(
                title: "My FitnessHub",
                description: "MyFitnessHub is a fitness app that provides personalized workout plans and tracking features.",
                bgColor: "PastelColor",
                img: "intro_1"
            )
                .transition(.opacity)
        } else if currentView == 2 {
            WalkthroughScreen(
                title: "Save your Life ",
                description: "MyFitnessHub offers body fat calculation and exercise tracking capabilities.",
                bgColor: "VilvetColor",
                img: "intro_2"
            )
        }
        
        if currentView ==
            3 {
            SplashView()
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}


