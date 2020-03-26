//
//  AppDelegate.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 21.05.18.
//  Copyright © 2018 Erik Maximilian Martens. All rights reserved.
//

import UIKit
import RxFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: - Properties
  
  internal var window: UIWindow?
  private var flowCoordinator: FlowCoordinator?
  
  private var dependencyManager: DependencyManager?
  
  // MARK: - Application Life Cycle
  
  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    return true
  }
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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

private extension AppDelegate {
  
  func launchUserInterface() {
    let mainFlow = MainFlow()
    flowCoordinator = FlowCoordinator()
    flowCoordinator?.coordinate(
      flow: mainFlow,
      with: MainStepper()
    )
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainFlow.root as? UITabBarController
    window?.makeKeyAndVisible()
  }
}
