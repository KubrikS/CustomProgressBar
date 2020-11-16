//
//  CustomProgressBar.swift
//  CustomProgressBar
//
//  Created by Stanislav on 16.11.2020.
//

import UIKit

class CircularProgressView: UIView {
    // First create two layer properties
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    
    func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 15, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        
        circleLayer.path = circularPath.cgPath
        circleLayer.lineCap = .butt
        circleLayer.lineWidth = circularPath.bounds.height
        circleLayer.strokeColor = UIColor.systemGray5.cgColor
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .butt
        progressLayer.lineWidth = circularPath.bounds.height
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.white.cgColor
        
        layer.addSublayer(circleLayer)
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAni")
    }
}
