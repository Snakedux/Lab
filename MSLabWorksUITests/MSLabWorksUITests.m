//
//  MSLabWorksUITests.m
//  MSLabWorksUITests
//
//  Created by student on 03.03.16.
//  Copyright © 2016 NURE. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MSLabWorksUITests : XCTestCase

@end

@implementation MSLabWorksUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    NSAssert([app.tables.staticTexts containingType:XCUIElementTypeCell identifier:@"x5m"], @"fail");
    [app.tables.staticTexts[@"x5m"] tap];
    NSAssert(app.navigationBars[@"x5m"].buttons[@"Main Menu"], @"fail");
    [app.navigationBars[@"x5m"].buttons[@"Main Menu"] tap];
    

    
    
}


- (void)testExample2 {

    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Add New Car In Catalog"] tap];
    
    XCUIElement *textField = app.textFields[@"\U041c\U0430\U0440\U043a\U0430"];
    [textField tap];
    [textField typeText:@"1"];
    
    XCUIElement *textField2 = app.textFields[@"\U041c\U043e\U0434\U0435\U043b\U044c"];
    [textField2 tap];
    [textField2 typeText:@"1"];
    
    XCUIElement *textField3 = app.textFields[@"\U041a\U043e\U0440\U043e\U0431\U043a\U0430 \U043f\U0435\U0440\U0435\U0434\U0430\U0447"];
    [textField3 tap];
    [textField3 typeText:@"1"];
    
    XCUIElement *textField4 = app.textFields[@"\U041e\U0431\U044a\U0435\U043c \U0434\U0432\U0438\U0433\U0430\U0442\U0435\U043b\U044f"];
    [textField4 tap];
    [textField4 typeText:@"1"];
    
    XCUIElement *textField5 = app.textFields[@"\U0421\U0441\U044b\U043b\U043a\U0430 \U043d\U0430 \U0444\U043e\U0442\U043e"];
    [textField5 tap];
    [textField5 typeText:@"1"];
    
    XCUIElement *textField6 = app.textFields[@"\U0413\U043e\U0434 \U0432\U044b\U043f\U0443\U0441\U043a\U0430"];
    [textField6 tap];
    [textField6 typeText:@"1"];
    
    XCUIElement *textField7 = app.textFields[@"\U041f\U0440\U043e\U0431\U0435\U0433"];
    [textField7 tap];
    [textField7 typeText:@"1"];
    
    XCUIElement *textField8 = app.textFields[@"\U041d\U043e\U043c\U0435\U0440 \U0442\U0435\U043b\U0435\U0444\U043e\U043d\U0430"];
    [textField8 tap];
    [textField8 typeText:@"1"];
    
    XCUIElement *textField9 = app.textFields[@"\U0426\U0435\U043d\U0430 $"];
    [textField9 tap];
    [textField9 typeText:@"1"];
    [app.buttons[@"Save"] tap];
    [app.navigationBars[@"Add New Car"].buttons[@"Main Menu"] tap];

}


@end
