//
//  MyFitnessHubUITests.swift
//  MyFitnessHubUITests
//
//  Created by Minosh Imantha on 2023-06-16.
//

import XCTest

final class MyFitnessHubUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

        func testExample() throws {

      
        let app = XCUIApplication()
                app.launch()
            
            
//      4
            
//            app.tabBars["Tab Bar"].buttons["Body Fact"].tap()
//            app/*@START_MENU_TOKEN@*/.buttons["Female"]/*[[".segmentedControls.buttons[\"Female\"]",".buttons[\"Female\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//            app.textFields["Age"].tap()
//
//            let weightKgTextField = app.textFields["Weight (kg)"]
//            weightKgTextField.tap()
//            weightKgTextField.tap()
//
//            let heightTextField = app.textFields["Height"]
//            heightTextField.tap()
//            heightTextField.tap()
//
//            let neckMeasurementTextField = app.textFields["Neck Measurement"]
//            neckMeasurementTextField.tap()
//            neckMeasurementTextField.tap()
//
//            let chestMeasurementTextField = app.textFields["Chest Measurement"]
//            chestMeasurementTextField.tap()
//            chestMeasurementTextField.tap()
//            app.buttons["Calculate"].tap()
//            app.buttons["Reset"].tap()

//
            
            
            
            //3
            
//            let collectionViewsQuery = XCUIApplication().collectionViews
//            collectionViewsQuery.children(matching: .cell).element(boundBy: 5).buttons["Favorite"].tap()
//            collectionViewsQuery.children(matching: .cell).element(boundBy: 4).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()

            
            
            
            //2
        
//            let tabBar = app.tabBars["Tab Bar"]
//            tabBar.buttons["Add Exercise"].tap()
//            tabBar.buttons["Body Fact"].tap()
//            tabBar.buttons["Settings"].tap()
//
//            let darkModeSwitch = app.collectionViews/*@START_MENU_TOKEN@*/.switches["Dark Mode"]/*[[".cells.switches[\"Dark Mode\"]",".switches[\"Dark Mode\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//            darkModeSwitch.tap()
//            darkModeSwitch.tap()
//            darkModeSwitch.tap()
//
                
                                    
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
 

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
