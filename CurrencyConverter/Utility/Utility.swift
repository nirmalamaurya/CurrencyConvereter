//
//  Utility.swift
//  CurrencyConverter
//
//  Created by Nirmala on 13/1/21.
//

import UIKit

let APIKey = "6266d2a41a5950256313b48515b22ed2"
let baseURL = "http://data.fixer.io/api/latest"


extension UIView {
   func createDottedLine(width: CGFloat, color: CGColor) {
      let caShapeLayer = CAShapeLayer()
      caShapeLayer.strokeColor = color
      caShapeLayer.lineWidth = width
      caShapeLayer.lineDashPattern = [8,8]
      let cgPath = CGMutablePath()
      let cgPoint = [CGPoint(x: 10, y: 0), CGPoint(x: self.frame.width-20, y: 0)]
      cgPath.addLines(between: cgPoint)
      caShapeLayer.path = cgPath
      layer.addSublayer(caShapeLayer)
   }
}
