//
//  ExerciseModel.swift
//  MyFitnessHub
//
//  Created by Minosh Imantha on 2023-06-15.
//

import Foundation
import CoreData

@objc(Exercise)
public class Exercise: NSManagedObject {
    @NSManaged public var name: String
    @NSManaged public var notes: String
    @NSManaged public var bodyPart: String
    @NSManaged public var reputation: Double
    @NSManaged public var date: Date
    @NSManaged public var isMorningSelected: Bool
    @NSManaged public var isEveningSelected: Bool
    @NSManaged public var isNightSelected: Bool
}
