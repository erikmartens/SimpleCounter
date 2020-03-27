//
//  CounterList.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 27.06.18.
//  Copyright © 2018 Erik Maximilian Martens. All rights reserved.
//

import Foundation

struct CounterCollection {
    let identifier: String
    let title: String
    let lastModifiedDate: Date
    let associatedCounterIdentifiers: [String]
}
