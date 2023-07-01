//
//  AddExerciseScreen.swift
//  MyFitnessHub
//
//  Created by Minosh Imantha on 2023-06-15.
//

import SwiftUI
import CoreData

struct AddExerciseScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var name: String = ""
    @State private var notes: String = ""
    @State private var selectedBodyPart = BodyPart.chest
    @State private var selectedDate = Date()
    @State private var reputation: Double = 50
    @State private var isMorningSelected = false
    @State private var isEveningSelected = false
    @State private var isNightSelected = false
    
    enum BodyPart: String, CaseIterable, Identifiable {
        case chest
        case shoulders
        case abs
        
        var id: String { self.rawValue }
    }
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Enter exercise name", text: $name)
                }
                
                Section(header: Text("Notes")) {
                    TextField("Enter notes", text: $notes)
                }
                
                Section(header: Text("Body Part")) {
                    Picker("Select body part", selection: $selectedBodyPart) {
                        ForEach(BodyPart.allCases, id: \.self) { part in
                            Text(part.rawValue.capitalized).tag(part)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Reps (\(Int(reputation)))")) {
                    Slider(value: $reputation, in: 1...100, step: 1)
                }
                
                Section(header: Text("Date")) {
                    DatePicker("Select date", selection: $selectedDate, displayedComponents: .date)
                }
                
                Section(header: Text("Daytime")) {
                    Toggle("Morning", isOn: $isMorningSelected)
                    Toggle("Evening", isOn: $isEveningSelected)
                    Toggle("Night", isOn: $isNightSelected)
                }
            }
            .navigationBarTitle("Add Exercise")
            .navigationBarItems(
                trailing: Button(action: { self.saveExercise() }) {
                    Text("Save")
                }
            )
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success"), message: Text("Exercise added successfully"), dismissButton: .default(Text("OK")))
            }
        }
        .sheet(isPresented: $showAlert, onDismiss: {
            // Reset form values
            name = ""
            notes = ""
            selectedBodyPart = .chest
            selectedDate = Date()
            reputation = 50
            isMorningSelected = false
            isEveningSelected = false
            isNightSelected = false
        }) {
           ViewExerciseScreen()
        }
    }
    
    func saveExercise() {
        let newExercise = Entity(context: viewContext)
        newExercise.name = name
        newExercise.notes = notes
        newExercise.bodyPart = selectedBodyPart.rawValue
        newExercise.reputation = reputation
        newExercise.date = selectedDate
        newExercise.isMorningSelected = isMorningSelected
        newExercise.isEveningSelected = isEveningSelected
        newExercise.isNightSelected = isNightSelected
        
        do {
            try viewContext.save()
            showAlert = true
            print("Exercise saved to Core Data")
            printCoreDataEntities()
        } catch {
            print("Failed to save exercise: \(error.localizedDescription)")
        }
    }
    
    func printCoreDataEntities() {
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        
        do {
            let entities = try viewContext.fetch(fetchRequest)
            entities.forEach { entity in
                print("Exercise name: \(entity.name ?? "")")
                print("Notes: \(entity.notes ?? "")")
                print("Body Part: \(entity.bodyPart ?? "")")
                print("Reps: \(entity.reputation)")
                print("Date: \(entity.date ?? Date())")
                print("Is Morning Selected: \(entity.isMorningSelected)")
                print("Is Evening Selected: \(entity.isEveningSelected)")
                print("Is Night Selected: \(entity.isNightSelected)")
                print("------------------------------------")
            }
        } catch {
            print("Failed to fetch exercises: \(error.localizedDescription)")
        }
    }
}

struct AddExerciseScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseScreen()
    }
}
