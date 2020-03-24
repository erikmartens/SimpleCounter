//
//  AppDelegate.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 21.05.18.
//  Copyright © 2018 Erik Maximilian Martens. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: - Properties
  
  internal var window: UIWindow?
  private var mainFlow: MainFlow?
  
  private var dependencyManager: DependencyManager?
  
  // MARK: - Application Life Cycle
  
  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    return true
  }
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    launchUserInterface()
    
    return true
  }
  
  func applicationWillResignActive(_ application: UIApplication) {}
  
  func applicationDidEnterBackground(_ application: UIApplication) {}
  
  func applicationWillEnterForeground(_ application: UIApplication) {}
  
  func applicationDidBecomeActive(_ application: UIApplication) {}
  
  func applicationWillTerminate(_ application: UIApplication) {}
}

// MARK: - Helper Functions

extension AppDelegate {
  
  fileprivate func launchUserInterface() {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let mainStepper = MainStepper()
    let mainFlow = MainFlow(stepper: mainStepper)
    
    self.mainFlow = mainFlow
    
    window?.rootViewController = mainFlow.root as? UITabBarController
    window?.makeKeyAndVisible()
  }
}
