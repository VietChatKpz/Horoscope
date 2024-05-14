//
//  CustomLineView.swift
//  HoroScope
//
//  Created by VietChat on 14/5/24.
//

import UIKit

class CustomLineView: UIView {
    
    private var points: [CGPoint] = []
    
    func addPoint(_ point: CGPoint) {
        points.append(point)
        setNeedsLayout()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard points.count > 1 else { return }
        
        let path = UIBezierPath()
        path.move(to: points[0])
        
        for i in 1..<points.count {
            path.addLine(to: points[i])
            path.addLine(to: points[0])
        }

        path.close()
        Constants.colorDefault.setStroke()
        path.lineWidth = 1.0
        path.stroke()
    }
}
