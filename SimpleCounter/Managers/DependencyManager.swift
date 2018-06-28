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
    
    //    private let application: UIApplication
    //    private let mainBundle: Bundle
    private let fileManager: FileManager
    private let fileDirectoryBaseUrlGetter: (() -> (URL))
    
    // MARK: - Intialization
    
    init(/*application: UIApplication, mainBundle: Bundle, */fileManager: FileManager, fileDirectoryBaseUrlGetter: @escaping (() -> (URL))) {
        //        self.application = application
        //        self.mainBundle = mainBundle
        self.fileManager = fileManager
        self.fileDirectoryBaseUrlGetter = fileDirectoryBaseUrlGetter
    }
    
    // MARK: - Dependencies
    
    lazy var dataStore: DataStore = { [unowned self] in
        return DataStore(fileManager: fileManager, fileDirectoryBaseUrlGetter: fileDirectoryBaseUrlGetter)
        }()
}
