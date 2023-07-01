

# Project Name - My Fitness App


#### 01. Brief Description of Project - 
My fitnesshub app allows users to create exercise programs and manage them.Users can add exercise programs to their app, allowing them to create personalized workout routines. They can also remove exercise programs when they no longer need them. The app also incorporates Core ML, utilizing Create ML, to predict body fat based on user input or data. This feature adds a valuable health assessment component to the app. and alos ,  to enhance the user experience, your app includes a settings page where users can customize the app's appearance. Users have the option to switch between dark and light modes, providing a visually appealing and personalized experience. This flexibility in theme selection caters to users' preferences and enhances usability

#### 02. Users of the System - 
Health-conscious Individuals , Fitness Professionals , Fitness Enthusiasts and working people

#### 03. What is unique about your solution -  
app can offer personalized exercise programs based on user goals, fitness level, and preferences. By tailoring the programs to individual needs, users can experience a more targeted and effective fitness journey. and ntegrating Core ML and machine learning algorithms, your app can predict body fat percentage based on user input, such as height, weight, and other relevant data. This feature provides users with valuable insights into their body composition and progress. 



<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.56.41.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.57.16.png">

</div>
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.57.29.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.58.59.png">

</div>
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.58.27.png">
</div>
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.59.13.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.59.41.png">
</div>
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 21.00.36.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 21.00.28.png">
</div>
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 21.00.16.png">
</div>
<div>
<img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.58.49.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.59.51.png">
  <img width="314" alt="LaunchScreen" src="Resources/Screenshot 2023-06-16 at 20.59.57.png">
</div>




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



it hard to implement machine learning getting errors

sometimes be challenging. Identifying and resolving issues

optimizing code for better performance.

