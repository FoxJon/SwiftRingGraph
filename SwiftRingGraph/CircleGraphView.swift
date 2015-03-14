import UIKit

@IBDesignable
class CircleGraphView: UIView {
    
    override func drawRect(rect: CGRect) {
        let fullCircle = 2.0 * CGFloat(M_PI)
        let centerPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        let arcWidth:CGFloat = 35.0
        let radius = (CGRectGetWidth(rect) - arcWidth) / 2.0
        
        let context = UIGraphicsGetCurrentContext()
        
        //make the inner circle
        CGContextSetFillColorWithColor(context, UIColor(red: 0.063, green: 0.169, blue: 0.867, alpha: 1.0).CGColor)
        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius , 0, fullCircle, 0)
        CGContextFillPath(context)
        
        //make the outer circle
        let outerCircleColor = UIColor(red: 0.063, green: 0.169, blue: 0.867, alpha: 0.5)
        CGContextSetStrokeColorWithColor(context, outerCircleColor.CGColor)
        CGContextSetLineWidth(context, arcWidth)
        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, 0, fullCircle, 0)
        CGContextStrokePath(context)
    }
}
