//
//  AppDelegate.swift
//  Directional Simon Says
//
//  Created by Deanna Yee on 12/9/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let scoreStore = ScoreStore()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let navController = window!.rootViewController as! UINavigationController
        let controller = navController.topViewController as! MainMenuViewController
        controller.scoreStore = scoreStore
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        let tapSuccess = scoreStore.saveTapChanges()
        if (tapSuccess) {
            print("Saved all of the tap Scores")
        } else {
            print("Could not save any of the tap Scores")
        }
        
        let swipeSuccess = scoreStore.saveTapChanges()
        if (swipeSuccess) {
            print("Saved all of the swipe Scores")
        } else {
            print("Could not save any of the swipe Scores")
        }
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

