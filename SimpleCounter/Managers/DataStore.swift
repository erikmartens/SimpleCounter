//
//  DataStore.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.06.18.
//  Copyright © 2018 Erik Maximilian Martens. All rights reserved.
//

import Foundation

enum StorageType: Int {
    case userSettings
    case userData
}

class DataStore {
    
    // MARK: - Properties
    
    fileprivate let fileManager: FileManager
    private let fileDirectoryBaseUrlGetter: () -> (URL)
    
    // MARK: - Initialization
    
    init(fileManager: FileManager, fileDirectoryBaseUrlGetter: @escaping (() -> (URL))) {
        
        self.fileManager = fileManager
        self.fileDirectoryBaseUrlGetter = fileDirectoryBaseUrlGetter
        
        // basedirectoy (application support directory) may not exist yet, has to be created first
        if !fileManager.fileExists(atPath: baseDirectoryUrl.path, isDirectory: nil) {
            do {
                try fileManager.createDirectory(at: baseDirectoryUrl, withIntermediateDirectories: true, attributes: nil)
            } catch {
                // TOOD: Error Logging
                fatalError(error.localizedDescription)
            }
        }
    }
}

// MARK: - File Access Functions

extension DataStore {
    
    func readValue(for key: String, fromDictWithStorageType type: StorageType) -> Any? {
        let dictionary = retrieveDictionary(with: type)
        let value = dictionary?[key]
        return value
    }
    
    func writeValue(_ value: Any?, for key: String, toDictWithStorageType type: StorageType) {
        guard var dictionary = retrieveDictionary(with: type) else {
            // TODO: Error Logging
            return
        }
        
        if value != nil {
            dictionary[key] = value
        } else {
            dictionary.removeValue(forKey: key)
        }
        storeDictionary(dictionary, with: type)
    }
}

// MARK: - File Management Functions

extension DataStore {
    
    private func storeDictionary(_ dictionary: [String: Any], with storageType: StorageType) {
        let filePathUrl = self.filePathUrl(for: storageType)
        do {
            let data = try PropertyListSerialization.data(fromPropertyList: dictionary, format: .xml, options: 0) // options param currently unused via Apple Doc
            // file will be created implicitely if not existent
            try data.write(to: filePathUrl)
        } catch {
            // only catch error for reporting, app should crash if error is encountered
            // TODO: Error Logging
            fatalError(error.localizedDescription)
        }
    }
    
    fileprivate func retrieveDictionary(with storageType: StorageType) -> [String: Any]? {
        createFileIfNeeded(for: storageType) // file may not have been created yet or user ID was changed in the meantime -> FileManager throws error when accessing non-existent file
        
        let filePathUrl = self.filePathUrl(for: storageType)
        do {
            let data = try Data(contentsOf: filePathUrl, options: .mappedIfSafe)
            let dictionary = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: AnyHashable]
            return dictionary
        } catch {
            // only catch error for reporting
            // the file that is requested was discarded, so the operation on the file is no longer necessary
            // TODO: Error Logging
            return nil
        }
    }
}

// MARK: - File Management Helpers

extension DataStore {
   
    fileprivate var baseDirectoryUrl: URL {
        return fileDirectoryBaseUrlGetter()
    }
    
    fileprivate func fileName(for storageType: StorageType) -> String {
        switch storageType {
        case .userSettings:
            return "dictionary_user_settings"
        case .userData:
            return "dictionary_user_data"
        }
    }
    
    func filePathUrl(for storageType: StorageType) -> URL {
        let fileName = self.fileName(for: storageType)
        let fileExtension = "plist"
        return baseDirectoryUrl.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    }
    
    func createFileIfNeeded(for storageType: StorageType) {
        let filePathUrl = self.filePathUrl(for: storageType)
        
        if fileManager.fileExists(atPath: filePathUrl.path) { return }
        
        // create new file
        do {
            let data = try PropertyListSerialization.data(fromPropertyList: [:], format: .xml, options: 0) // options param currently unused via Apple Doc
            try data.write(to: filePathUrl) // file will be created implicitely if not existent
        } catch {
            // only catch error for reporting, app should crash if error is encountered
            // TODO: Error Logging
            fatalError(error.localizedDescription)
        }
    }
}
