//
//  AppRouter.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.06.18.
//  Copyright © 2018 Erik Maximilian Martens. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator {
    
    // MARK: - Properties
    
    private let dependencyManager: DependencyManager
    
//    private var childCoordinators = [AppCoordinator]()
    private let mainTabBarController: UITabBarController
    
    // MARK: - Initialization
    
    init(dependencyManager: DependencyManager, mainTabBarController: UITabBarController) {
        self.dependencyManager = dependencyManager
        self.mainTabBarController = mainTabBarController
    }
}

// MARK: - App Start Operation

extension AppCoordinator {
    
    func start() {
        
        /* counter list */
        let counterListNav = R.storyboard.counterListStoryboard().instantiateInitialViewController() as! UINavigationController
        let counterList = counterListNav.viewControllers.first as? CounterListViewController
        counterList.router = self
        counterList.viewModel =
        counterList?.title = R.string.localizable.tabBar_counterListTitle().uppercased()
        counterList?.tabBarItem.selectedImage = R.image.tabbar_counter_list_active()
        counterList?.tabBarItem.image = R.image.tabbar_counter_list_inactive()
 
        
        //        tabbar?.viewControllers = [counterListNav!]
    }
}

extension AppCoordinator: CounterListRouter {
    
}
