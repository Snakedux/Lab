//
//  AppDelegate.m
//  MSLabWorks
//
//  Created by student on 03.03.16.
//  Copyright © 2016 NURE. All rights reserved.
//

#import "AppDelegate.h"
#import "Quickblox/Quickblox.h"


const NSUInteger ApplicationID = 37931;
NSString* const AuthKey = @"JFMhKFxacVhJFMq";
NSString* const AuthSecret = @"ppxuBguHPY8tGGV";
NSString* const AccountKey = @"x8HzCMFQiDJkyhyBv9Pd";

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void (^)(QBResponse *response, QBUUser *user))successBlock
{
    return ^(QBResponse *response, QBUUser *user) {
        // Login succeeded
    };
}

- (QBRequestErrorBlock)errorBlock
{
    return ^(QBResponse *response) {
        // Handle error
    };
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [QBSettings setApplicationID:ApplicationID];
    [QBSettings setAuthKey:AuthKey];
    [QBSettings setAuthSecret:AuthSecret];
    [QBSettings setAccountKey:AccountKey];
    
    /*
    // Create new user in QB
    QBUUser *user = [QBUUser user];
    user.password = @"password1234";
    user.login = @"login1234";
    
    // Registration/sign up of User
    [QBRequest signUp:user successBlock:^(QBResponse *response, QBUUser *user) {
        // Sign up was successful
        NSLog(@"SUCCESS!!!!!");
    } errorBlock:^(QBResponse *response) {
        // Handle error here
    }];
     
     */
    
    //Login
    [QBRequest logInWithUserLogin:@"login1234" password:@"password1234" successBlock:[self successBlock] errorBlock:[self errorBlock]];

    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
