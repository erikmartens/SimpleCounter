//
//  Factory+UITableView.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit.UITableView

extension Factory {
  
  struct TableView: FactoryFunction {
    typealias InputType = TableViewType
    typealias ResultType = UITableView
    
    enum TableViewType {
      case counterListObjectsList
    }
    
    static func make(fromType type: InputType) -> ResultType {
      switch type {
      case .counterListObjectsList:
        return UITableView()
      }
    }
  }
}
