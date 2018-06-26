//
//  DependencyManager.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.06.18.
//  Copyright © 2018 Erik Maximilian Martens. All rights reserved.
//

import UIKit
import Foundation

class DependencyManager {
    
    // MARK: - Properties
    
    private let application: UIApplication
    private let mainBundle: Bundle
    private let fileManager: FileManager
    
    // MARK: - Intialization
    
    init(application: UIApplication, mainBundle: Bundle, fileManager: FileManager) {
        self.application = application
        self.mainBundle = mainBundle
        self.fileManager = fileManager
    }
    
    // MARK: - Dependencies
    
    lazy var dataStore: DataStore = { [unowned self] in
        
        var userFileStorageBaseDirectoryGetter: (() -> (URL)) = { [unowned self] in
            guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                // only detect nil for reporting, app should crash if error is encountered
                // TODO: Error Logging
                fatalError()
            }
            return url
        }
        
        return DataStore(fileManager: fileManager, baseDirectoryUrlGetter: userFileStorageBaseDirectoryGetter)
        }()
}
