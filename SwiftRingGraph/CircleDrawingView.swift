import UIKit

class CircleDrawingView: UIView {
    
    let circleLayer = CAShapeLayer()
    var endAngleMultiplier:Double?
    
    let strokeEndAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return animation
        }()

    
    func setup(){
        circleLayer.lineWidth = 31.0
        circleLayer.strokeColor = tintColor.CGColor
        layer.addSublayer(circleLayer)
        circleLayer.addAnimation(strokeEndAnimation, forKey: "strokeEnd")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - circleLayer.lineWidth/2
        let startAngle = CGFloat(-M_PI_2)
        let endAngle = startAngle + CGFloat(M_PI * makeRandomNumber())
        let path = UIBezierPath(arcCenter: CGPointZero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        circleLayer.position = center
        circleLayer.path = path.CGPath
    }
    
    
    func makeRandomNumber()->Double {
        //random number between 1 and 2
        endAngleMultiplier = Double(arc4random()) / Double(UInt32.max) + 1
        return endAngleMultiplier!
    }
}
