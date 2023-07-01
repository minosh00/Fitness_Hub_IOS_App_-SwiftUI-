//
//  BodyFactsScreen.swift
//  MyFitnessHub
//
//  Created by Minosh Imantha on 2023-06-15.
//
import SwiftUI
import CoreML

enum Gender {
    case male
    case female
}

struct BodyFactsScreen: View {
    let model = BodyFacts()
    
    @State private var gender = Gender.male
    @State private var age = ""
    @State private var weight = ""
    @State private var height = ""
    @State private var neck = ""
    @State private var chest = ""
    
    @State private var bodyFat: Double = 0.0
    @State private var bodyFatDescription = ""
    @State private var treatmentInfo = ""
    
    private func calculateBodyFat() {
        // Convert user input to Double
        guard let age = Double(age),
              let weightInKg = Double(weight),
              let height = Double(height),
              let neck = Double(neck),
              let chest = Double(chest)
        else {
            // Handle invalid input
            return
        }
        
        // Convert weight from kg to lbs
        let weightInLbs = weightInKg * 2.20462
        
        do {
            let bodyFactsOutput = try model.prediction(Age: age, Weight: weightInLbs, Height: height, Neck: neck, Chest: chest)
            let bodyFat = bodyFactsOutput.BodyFat
            self.bodyFat = Double(bodyFat)
            
            // Determine body fat ranges and descriptions
            if gender == .male {
                if bodyFat < 2 {
                    // Body fat description for men in the "Essential Fat" range
                    bodyFatDescription = "Essential Fat (Men): 2% or less"
                    treatmentInfo = "Low body fat levels can lead to decreased hormone production. Make sure to maintain a healthy and balanced diet to support hormonal functions."
                } else if bodyFat >= 2 && bodyFat < 6 {
                    // Body fat description for men in the "Athletes" range
                    bodyFatDescription = "Athletes (Men): 2% to 5%"
                    treatmentInfo = "Maintaining body fat levels within the athlete range helps optimize performance. Continue following a structured exercise and nutrition program."
                } else if bodyFat >= 6 && bodyFat < 13 {
                    // Body fat description for men in the "Fitness" range
                    bodyFatDescription = "Fitness (Men): 6% to 13%"
                    treatmentInfo = "Fitness range indicates good health and body composition. Keep up with regular exercise and a balanced diet to maintain your fitness level."
                } else if bodyFat >= 13 && bodyFat < 25 {
                    // Body fat description for men in the "Acceptable" range
                    bodyFatDescription = "Acceptable (Men): 14% to 17%"
                    treatmentInfo = "While within an acceptable range, consider adjusting your diet and exercise routine to achieve a healthier body composition if desired."
                } else {
                    // Body fat description for men in the "Obese" range
                    bodyFatDescription = "Obese (Men): Over 25%"
                    treatmentInfo = "Obesity can lead to various health issues. Consult with a healthcare professional to develop a comprehensive weight loss plan."
                }
            } else {
                if bodyFat < 10 {
                    // Body fat description for women in the "Essential Fat" range
                    bodyFatDescription = "Essential Fat (Women): 10% or less"
                    treatmentInfo = "Low body fat levels can disrupt hormone production. Ensure a well-balanced diet to support hormonal functions."
                } else if bodyFat >= 10 && bodyFat < 14 {
                    // Body fat description for women in the "Athletes" range
                    bodyFatDescription = "Athletes (Women): 14% to 20%"
                    treatmentInfo = "Maintaining body fat levels within the athlete range helps optimize performance. Continue following a structured exercise and nutrition program."
                } else if bodyFat >= 14 && bodyFat < 21 {
                    // Body fat description for women in the "Fitness" range
                    bodyFatDescription = "Fitness (Women): 21% to 24%"
                    treatmentInfo = "Fitness range indicates good health and body composition. Keep up with regular exercise and a balanced diet to maintain your fitness level."
                } else if bodyFat >= 21 && bodyFat < 32 {
                    // Body fat description for women in the "Acceptable" range
                    bodyFatDescription = "Acceptable (Women): 25% to 31%"
                    treatmentInfo = "While within an acceptable range, consider adjusting your diet and exercise routine to achieve a healthier body composition if desired."
                } else {
                    // Body fat description for women in the "Obese" range
                    bodyFatDescription = "Obese (Women): Over 32%"
                    treatmentInfo = "Obesity can lead to various health issues. Consult with a healthcare professional to develop a comprehensive weight loss plan."
                }
            }
            
            // Reset user input
            self.age = ""
            self.weight = ""
            self.height = ""
            self.neck = ""
            self.chest = ""
            
        } catch {
            // Handle prediction error
            print("Prediction error: \(error)")
        }
    }
    
    private func reset() {
        // Reset user input and results
        self.age = ""
        self.weight = ""
        self.height = ""
        self.neck = ""
        self.chest = ""
        self.bodyFat = 0.0
        self.bodyFatDescription = ""
        self.treatmentInfo = ""
    }
    
    var body: some View {
        VStack {
            VStack {
                         Text("Body Facts calculate")
                             .font(.title)
                             .padding()
                         
                     }
                     .padding()
            Picker("Gender", selection: $gender) {
                Text("Male").tag(Gender.male)
                Text("Female").tag(Gender.female)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            TextField("Age", text: $age)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .textContentType(.oneTimeCode)
            
            TextField("Weight (kg)", text: $weight)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .textContentType(.oneTimeCode)
            
            TextField("Height", text: $height)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .textContentType(.oneTimeCode)
            
            TextField("Neck Measurement", text: $neck)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .textContentType(.oneTimeCode)
            
            TextField("Chest Measurement", text: $chest)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .textContentType(.oneTimeCode)
            
            ScrollView {
                VStack {
                   // Text("Body Fat: \(bodyFat, specifier: "%.2f")%")
                     //   .padding()
                      //  .font(.headline)
                    
                    Text(bodyFatDescription)
                        .padding()
                    
                    Text(treatmentInfo)
                        .padding()
                }
            }
            
            HStack {
                Button(action: {
                    calculateBodyFat()
                }) {
                    Text("Calculate")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    reset()
                }) {
                    Text("Reset")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

struct BodyFactsScreen_Previews: PreviewProvider {
    static var previews: some View {
        BodyFactsScreen()
    }
}
