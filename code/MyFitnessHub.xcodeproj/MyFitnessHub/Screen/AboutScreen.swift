//
//  AboutScreen.swift
//  MyFitnessHub
//
//  Created by Minosh Imantha on 2023-06-16.
import SwiftUI

struct AboutScreen: View {
    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Image("IMG_5475")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 50)
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                            
                        VStack(alignment: .leading) {
                            Button("Minosh Imantha") {
                            }
                            .font(.callout)
                            
                            Text("Set up iCloud, the App Store, and more.")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.all, 10)

                }
                
                Section {
                    HStack {
                        Image(systemName: "gear")
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        Picker(selection: $previewIndex, label: Text("General")) {
                        }
                    }
                    
                    HStack {
                        Image(systemName: "hand.raised.fill")
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        Picker(selection: $previewIndex, label: Text("Privacy")) {
                        }
                    }
                }
                
                Section(header: Text("Color Mode")) {
                    Toggle(isOn: $isPrivate) {
                        Text("Dark Mode")
                    }
                    .toggleStyle(DarkModeToggleStyle())
                }
                
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("IT Number")
                        Spacer()
                        Text("IT20088682")
                    }
                    HStack {
                        Text("Create By")
                        Spacer()
                        Text("Minosh Imantha")
                    }
                }
                
                Section {
                    Button(action: {
                        print("Perform an action here...")
                    }) {
                        Text("Reset All Settings")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
        .preferredColorScheme(isPrivate ? .dark : .light) // Apply color scheme to the NavigationView
    }
}

struct DarkModeToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Toggle(configuration)
            .toggleStyle(SwitchToggleStyle(tint: .blue))
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
