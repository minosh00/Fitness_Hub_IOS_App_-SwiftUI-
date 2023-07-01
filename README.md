[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/sHz1bMKn)
Please go under edit and edit this file as needed for your project.  There is no seperate documentation needed.

# Project Name - My Fitness App
# Student Id - IT20088682
# Student Name - K.D.M.I Jayathilaka

#### 01. Brief Description of Project - 
My fitnesshub app allows users to create exercise programs and manage them.Users can add exercise programs to their app, allowing them to create personalized workout routines. They can also remove exercise programs when they no longer need them. The app also incorporates Core ML, utilizing Create ML, to predict body fat based on user input or data. This feature adds a valuable health assessment component to the app. and alos ,  to enhance the user experience, your app includes a settings page where users can customize the app's appearance. Users have the option to switch between dark and light modes, providing a visually appealing and personalized experience. This flexibility in theme selection caters to users' preferences and enhances usability

#### 02. Users of the System - 
Health-conscious Individuals , Fitness Professionals , Fitness Enthusiasts and working people

#### 03. What is unique about your solution -  
app can offer personalized exercise programs based on user goals, fitness level, and preferences. By tailoring the programs to individual needs, users can experience a more targeted and effective fitness journey. and ntegrating Core ML and machine learning algorithms, your app can predict body fat percentage based on user input, such as height, weight, and other relevant data. This feature provides users with valuable insights into their body composition and progress. 

#### 04. Differences of Assignment 02 compared to Assignment 01.  
- Assignment 01 involved creating a contact app, while Assignment 02 involves developing a fitness app. Here are some potential differences between the two assignments and In Assignment 01, the focus was on building a contact app, which typically involves managing and organizing contact information such as names, phone numbers, and email addresses. On the other hand, Assignment 02 involves developing a fitness app that focuses on exercise programs, body fat prediction, progress tracking, and other fitness-related features 

#### 05. Briefly document the functionality of the screens you have (Include screen shots of images)
e.g. The first screen is used to capture a photo and it will be then processed for identifying the landmarks in the photo.

1.2 These two screens are home screen in my app 
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.56.41.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.57.16.png">

</div>

1.3 These two screens are used for adding a new exercise program, and they support both dark mode and light mode.
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.57.29.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.58.59.png">

</div>


1.4 These  screens are used for adding a new exercise program then after adding show sucess alert message 
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.58.27.png">
</div>


1.5 These two screens are used for predicting the body fat and displaying the percentage, as well as providing information about the treatment using CoreML.
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.59.13.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.59.41.png">

</div>

1.6 These two screens are provide user can remove some exercise program and  when user click delete option system ask dilaog content .
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 21.00.36.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 21.00.28.png">

</div>

1.7 These screen are provide user can see each exserice program.
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 21.00.16.png">

</div>
     
 1.8 These screen are provide user can see all exserice program separate bodt part.
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.58.49.png">

</div>
           

1.9 These two screens are used for User can change the color mode for dark or white and setting page here some infromation about this app.
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.59.51.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.59.57.png">

</div>



#### 06. Give examples of best practices used when writing code
The provided code appears to be a SwiftUI view called BodyFactsScreen that calculates body fat based on user input using a Core ML model called BodyFacts

```
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
           
```

#### 07. UI Components used

HStck
VStack
ZStak
Slider
picker
Button
TextFiled
Text
NaviationView
NavigationStack
ScrollView
ContainerRelativeShape
Spacer
#### 08. Testing carried out

e.g. The following classes implemented ui testing for the ``body fact calculate ``` and ```setting page```. 

```
    func testExample() throws {

      
        let app = XCUIApplication()
                app.launch()
            
            
          //  let app = XCUIApplication()
            let tabBar = app.tabBars["Tab Bar"]
            tabBar.buttons["Add Exercise"].tap()
            tabBar.buttons["Body Fact"].tap()
            tabBar.buttons["Settings"].tap()
            
            let darkModeSwitch = app.collectionViews/*@START_MENU_TOKEN@*/.switches["Dark Mode"]/*[[".cells.switches[\"Dark Mode\"]",".switches[\"Dark Mode\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            darkModeSwitch.tap()
            darkModeSwitch.tap()
            darkModeSwitch.tap()
                    
                
                                    
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        
        
        
                    app.tabBars["Tab Bar"].buttons["Body Fact"].tap()
            app/*@START_MENU_TOKEN@*/.buttons["Female"]/*[[".segmentedControls.buttons[\"Female\"]",".buttons[\"Female\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            app.textFields["Age"].tap()

            let weightKgTextField = app.textFields["Weight (kg)"]
            weightKgTextField.tap()
            weightKgTextField.tap()

            let heightTextField = app.textFields["Height"]
            heightTextField.tap()
            heightTextField.tap()

            let neckMeasurementTextField = app.textFields["Neck Measurement"]
            neckMeasurementTextField.tap()
            neckMeasurementTextField.tap()

            let chestMeasurementTextField = app.textFields["Chest Measurement"]
            chestMeasurementTextField.tap()
            chestMeasurementTextField.tap()
            app.buttons["Calculate"].tap()
            app.buttons["Reset"].tap()

    }  
```

#### 09. Documentation 

(a) Design Choices

(b) Implementation Decisions

The solution can be developed for both Apple tablets and iOS mobile applications, considering the target audience and the required functionality of the system.

The system can be implemented using various programming languages, including Swift, SwiftUI 

Database: To store contacts, the system may utilize a database. In the previous project, Core Data was used to temporarily store the added contacts. However, when converting to SwiftUI same core data used 

User Interface Design: The user interface of the system should be user-friendly, visually appealing, and adaptable to different devices and screen sizes. In the transition to SwiftUI, you will have the opportunity to redesign and create an interface using SwiftUI's declarative syntax, which offers flexibility and adaptability.

Testing and Deployment: It is crucial to thoroughly test the system before deployment to ensure it functions correctly and meets the requirements. Unit testing is a common practice for testing individual components.



(c) Challenges
 The main challenges is SwiftUI is a relatively new framework compared to UIKit, so there might be a learning curve in understanding its concepts and syntax. Core Data also has its own set of concepts and patterns that need to be grasped

The main challenges is SwiftUI has a growing ecosystem of third-party libraries and dependencies, but not all of them might be fully compatible or have comprehensive support for Core Data.

The main challenges is how to cretae core ml and create ml model and how it conect to. ios app correcly 
#### 10. Additional iOS Library used
coreML
Create ML

A brief description on how you addressed the last part of the marking rubric.

#### 11. Reflection of using SwiftUI compared to UIKit

SwiftUI is built using Swift and takes full advantage of the language's features and capabilities. This integration allows for a more streamlined and efficient development process, benefiting from Swift's type safety, optionals, generics, and other modern language constructs.

Reflection of using SwiftUI compared to UIKit

#### 12. Reflection General

Challenges that you faced in doing the assingment (other than know technical issues of getting hold of a proper Mac machine).
How would have approached this Assignment differently

it hard to implement machine learning getting errors

sometimes be challenging. Identifying and resolving issues

optimizing code for better performance.

