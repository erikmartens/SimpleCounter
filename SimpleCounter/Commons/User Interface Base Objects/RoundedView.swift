//
//  RoundedView.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

public protocol RoundedView: UIView {
  var topInsets: CGFloat { get }
  var bottomInsets: CGFloat { get }
  var leadingInsets: CGFloat { get }
  var trailingInsets: CGFloat { get }
}

extension RoundedView {
  func roundCorners(_ corners: UIRectCorner, withRadius radius: CGFloat) {
    let roundedBounds = CGRect(
      x: bounds.minX + leadingInsets,
      y: bounds.minY + topInsets,
      width: bounds.width - leadingInsets - trailingInsets,
      height: bounds.height - topInsets - bottomInsets
    )
    
    let maskingLayer = CAShapeLayer()
    let maskingPath = UIBezierPath(
      roundedRect: CGRect(x: 0,
                          y: 0,
                          width: roundedBounds.width,
                          height: roundedBounds.height),
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius,
                          height: radius)
    )
    
    maskingLayer.frame = roundedBounds
    maskingLayer.path = maskingPath.cgPath
    layer.mask = maskingLayer
  }
}
