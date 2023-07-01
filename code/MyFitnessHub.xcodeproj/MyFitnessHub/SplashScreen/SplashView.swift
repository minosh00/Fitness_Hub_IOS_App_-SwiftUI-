//
//  SplashView.swift
//  MyFitnessHub
//
//  Created by Minosh Imantha on 2023-06-15.
//

import SwiftUI
                        
    struct SplashView: View {
        var body: some View {
            ContentView()
        }
    }


    struct WalkthroughScreen: View {
        
        @AppStorage("currentView") var currentView = 1
        
        var title: String
        var description: String
        var bgColor: String
        var img: String
        
        var body: some View {
            ZStack{
                VStack{
                    HStack {
                        Text("Greetings!")
                            .foregroundColor(Color.black)
                            .accessibilityLabel("Greetings!")
                            .fontWeight(.bold)
                        Spacer()
                        Button(
                            action:{
                                currentView = 4
                            },
                            label: {
                                Text("Skip")
                                    .foregroundColor(Color.black)
                            }
                        )
                    }.padding()
                    Spacer()
                    VStack(alignment: .leading){
                        Image(img)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Text(title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .font(.title)
                            .padding(.top)
                        
                        
                        Text(description)
                            .padding(.top, 5.0)
                            .foregroundColor(Color.black)
                        Spacer(minLength: 0)
                    }
                    .padding()
                    .overlay(
                        HStack{
                            
                            if currentView == 1 {
                                ContainerRelativeShape()
                                    .foregroundColor(.black)
                                    .frame(width: 25, height: 5)
                            } else {
                                ContainerRelativeShape()
                                    .foregroundColor(.black.opacity(0.5))
                                    .frame(width: 25, height: 5)
                            }
                            
                            if currentView == 2 {
                                ContainerRelativeShape()
                                    .foregroundColor(.black)
                                    .frame(width: 25, height: 5)
                            } else {
                                ContainerRelativeShape()
                                    .foregroundColor(.black.opacity(0.5))
                                    .frame(width: 25, height: 5)
                            }
                            
                            if currentView == 3 {
                                ContainerRelativeShape()
                                    .foregroundColor(.black)
                                    .frame(width: 25, height: 5)
                            } else {
                                ContainerRelativeShape()
                                    .foregroundColor(.black.opacity(0.5))
                                    .frame(width: 25, height: 5)
                            }
                            
                            Spacer()
                            Button(
                                action:{
                                    withAnimation(.easeOut) {
                                        if currentView <= totalViews || currentView == 2 {
                                            currentView += 1
                                        } else if currentView == 3 {
                                            currentView = 1
                                        }
                                    }
                                },
                                label: {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 35.0, weight: .semibold))
                                        .frame(width: 55, height: 55)
                                        .background(Color("BgNextBtn"))
                                        .clipShape(Circle())
                                        .padding(17)
                                        .overlay(
                                            ZStack{
                                                Circle()
                                                    .stroke(Color.white.opacity(0.4), lineWidth: 2)
                                                    .padding()
                                                    .foregroundColor(Color.white)
                                            }
                                        )
                                }
                            )
                        }
                            .padding()
                        ,alignment: .bottomTrailing
                    )
                }
            }
            //.background(Color(bgColor).ignoresSafeArea())
            .background(
                           LinearGradient(colors: [
                               Color(bgColor),Color("BgNextBtn")]
                                          ,startPoint: .top, endPoint: .bottom)
                       )
        }
    }

  
