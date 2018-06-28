//
//  Instantiable.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 28.06.18.
//  Copyright © 2018 Erik Maximilian Martens. All rights reserved.
//

import UIKit

protocol Instantiable {
    static func instantiateFromStoryboard(withName name: String) -> Self
}

extension Instantiable where Self: UIViewController {
    
    static func instantiateFromStoryboard(withName name: String) -> Self {
        
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
