//
//  ViewExerciseScreen.swift
//  MyFitnessHub
//
//  Created by Minosh Imantha on 2023-06-15.
//

import SwiftUI
import CoreData


enum BodyParts: String, CaseIterable {
    case chest
    case shoulders
    case abs
}

struct WorkoutRow: View {
    var workout: Entity
    
    @State private var isStarSelected = false
    
    var body: some View {
        HStack {
            Button(action: { isStarSelected.toggle() }) {
                Image(systemName: isStarSelected ? "star.fill" : "star")
                    .foregroundColor(isStarSelected ? .yellow : .red)
            }
            
            VStack(alignment: .leading) {
                Text(workout.name ?? "")
                    .font(.headline)
                Text(workout.notes ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                if let date = workout.date {
                    Text(dateString(from: date))
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(Color(.sRGB, red: 0.85, green: 0.95, blue: 0.85, opacity: 1.0))
                        .cornerRadius(10)
                }
            }
        }
    }
    
    private func dateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: date)
    }
}



struct ViewExerciseScreen: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @FetchRequest(entity: Entity.entity(), sortDescriptors: []) private var workouts: FetchedResults<Entity>
    
    @State private var shouldShowDeleteConfirmation = false
    @State private var deleteIndex = -1 // Placeholder value for deleteIndex
    
    @State private var showAddWorkout = false
    @State private var selectedWorkout: Entity? // Track selected workout
    
    var body: some View {
        NavigationView {
            ZStack {
                if workouts.count == 0 {
                    Text("No workouts added")
                        .foregroundColor(.gray)
                        .padding()
                }
                List {
                    ForEach(BodyParts.allCases, id: \.self) { part in
                        let filteredWorkouts = workouts.filter { $0.bodyPart == part.rawValue }
                        if filteredWorkouts.count > 0 {
                            Section(header: Text(part.rawValue)) {
                                ForEach(filteredWorkouts) { workout in
                                    WorkoutRow(workout: workout)
                                        .onTapGesture {
                                            self.selectedWorkout = workout // Set the selected workout
                                        }
                                }
                                .onDelete { (indexSet) in
                                    if let index = indexSet.first, index < filteredWorkouts.count {
                                        let filteredWorkout = filteredWorkouts[index]
                                        if let i = workouts.firstIndex(of: filteredWorkout) {
                                            self.deleteIndex = i
                                            self.shouldShowDeleteConfirmation.toggle()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
              
            }
            .navigationTitle("Exercise Program")
            .navigationBarItems(trailing: EditButton())
            .alert(isPresented: $shouldShowDeleteConfirmation) { () -> Alert in
                Alert(title: Text("Confirm"), message: Text("Are you sure you want to delete this workout?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Delete"), action: {
                    withAnimation {
                        if self.deleteIndex != -1 { // Check against placeholder value
                            self.deleteWorkout(workout: self.workouts[self.deleteIndex])
                        }
                    }
                }))
            }
            .sheet(item: $selectedWorkout) { workout in
                InDetailsView(workout: workout)
            }
        }
    }
    
    private func deleteWorkout(workout: Entity) {
        managedObjectContext.delete(workout)
        do {
            try managedObjectContext.save()
        } catch {
            print("Failed to delete workout: \(error.localizedDescription)")
        }
    }
}

struct ViewExerciseScreen_Previews: PreviewProvider {
    static var previews: some View {
        ViewExerciseScreen()
    }
}
