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
    private var mainTabBarController: UITabBarController?
    
    private var dependencyManager: DependencyManager?
    private var appRouter: AppCoordinator?
    
    // MARK: - Computed Properties
    
    internal lazy var fileManager: FileManager = {
        return FileManager.default
    }()
    
    internal lazy var fileBaseDirectoryUrlGetter: (() -> (URL)) = {
        return { [unowned self] in
            guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                // only detect nil for reporting, app should crash if error is encountered
                // TODO: Error Logging
                fatalError()
            }
            return url
        }
    }()
    
    // MARK: - Application Life Cycle
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        dependencyManager = DependencyManager(fileManager: fileManager, fileDirectoryBaseUrlGetter: fileBaseDirectoryUrlGetter)
        
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupAppearanceProxies()
        startApp()
        
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
    
    // TODO: Transform to NSOperations
    // approuter has to show initial view controller AFTER tabbar was set up
    
    // 1.
    fileprivate func setupAppearanceProxies() {
        
        /* tab bar */
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .red
    }
    
    // 2.
    fileprivate func startApp() {
        mainTabBarController = UITabBarController()
        appRouter = AppCoordinator(dependencyManager: dependencyManager!, mainTabBarController: mainTabBarController!)
        
        appRouter?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainTabBarController
        window?.makeKeyAndVisible()
    }
}
