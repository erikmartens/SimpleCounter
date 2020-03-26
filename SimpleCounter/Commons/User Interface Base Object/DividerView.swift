//
//  DividerView.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

protocol DividerView: UIView {
  var dividerView: UIView { get }
}

extension DividerView {
  func layoutDividerView(withLeadingView leadingView: UIView, bottomView: UIView, dividerColor: UIColor) {
    dividerView.backgroundColor = dividerColor
    dividerView.translatesAutoresizingMaskIntoConstraints = false

    let constraints = [dividerView.leadingAnchor.constraint(equalTo: leadingView.leadingAnchor),
                       dividerView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
                       dividerView.heightAnchor.constraint(equalToConstant: 1/UIScreen.main.scale),
                       dividerView.trailingAnchor.constraint(equalTo: trailingAnchor)]
    
    addSubview(dividerView, constraints: constraints)
  }
}
