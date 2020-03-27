//
//  UITableView+ReloadDataAnimated.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

extension UITableView {
  func reloadDataAnimated() {
    UIView.transition(with: self,
                      duration: 0.2,
                      options: .transitionCrossDissolve,
                      animations: { self.reloadData() },
                      completion: nil)
  }
}
