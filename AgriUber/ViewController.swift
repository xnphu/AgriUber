//
//  ViewController.swift
//  AgriUber
//
//  Created by Nguyen Xuan Phu on 3/24/21.
//  Copyright © 2021 Nguyen Xuan Phu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Propreties
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBAction func dismissCreateOrder(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        let attributedString = NSAttributedString(string: "Forgot password", attributes: [NSAttributedString.Key.underlineStyle: 1.0,])
        //        forgotPasswordLabel.attributedText = attributedString
    }
    
    
}

extension UIView {
    
    func addShadow(shadowColor: UIColor, offSet: CGSize, opacity: Float, shadowRadius: CGFloat, cornerRadius: CGFloat, corners: UIRectCorner, fillColor: UIColor = .white) {
        
        let shadowLayer = CAShapeLayer()
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let cgPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size).cgPath //1
        shadowLayer.path = cgPath //2
        shadowLayer.fillColor = fillColor.cgColor //3
        shadowLayer.shadowColor = shadowColor.cgColor //4
        shadowLayer.shadowPath = cgPath
        shadowLayer.shadowOffset = offSet //5
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = shadowRadius
        self.layer.addSublayer(shadowLayer)
    }
    
    func drawDashTicket() {
        let radius: CGFloat = 10
        let viewHeight = self.frame.size.height
        let viewWidth = self.frame.size.width
        
        // Draw left arc
        let leftLayer = CAShapeLayer.init()
        let leftArcPath = UIBezierPath(arcCenter: CGPoint.init(x: 0, y: viewHeight/2), radius: radius, startAngle: CGFloat(-rad(90)), endAngle: CGFloat(rad(90)), clockwise: true)
        leftLayer.path = leftArcPath.cgPath
        leftLayer.strokeColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9764705882, alpha: 1)
        leftLayer.backgroundColor = UIColor.clear.cgColor
        leftLayer.fillColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9764705882, alpha: 1)
        self.layer.addSublayer(leftLayer)
        
        // Draw dash line
        let rect = CGRect.init(origin: CGPoint.init(x: radius, y: viewHeight/2), size: CGSize.init(width: viewWidth - 2 * radius, height: 0))//Set Height width as you want
        
        let layer = CAShapeLayer.init()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 8)
        layer.path = path.cgPath;
        layer.strokeColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1); // Set Dashed line Color
        layer.lineDashPattern = [4, 8]; // Here you set line length
        self.layer.addSublayer(layer)
        
        // Draw right arc
        let rightLayer = CAShapeLayer.init()
        let rightArcPath = UIBezierPath(arcCenter: CGPoint.init(x: viewWidth, y: viewHeight/2), radius: radius, startAngle: CGFloat(-rad(90)), endAngle: CGFloat(rad(90)), clockwise: false)
        rightLayer.path = rightArcPath.cgPath
        rightLayer.strokeColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9764705882, alpha: 1)
        rightLayer.backgroundColor = UIColor.clear.cgColor
        rightLayer.fillColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9764705882, alpha: 1)
        self.layer.addSublayer(rightLayer)
    }
    
    func drawDashLine(isVertical: Bool) {
        let viewHeight = self.frame.size.height
        let viewWidth = self.frame.size.width
        
        // Draw dash line
        let rect = CGRect.init(origin: CGPoint.init(x: 0, y: viewHeight/2), size: CGSize.init(width: viewWidth, height: 0))//Set Height width as you want
        
        let layer = CAShapeLayer.init()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 0)
        layer.path = path.cgPath;
        layer.strokeColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1); // Set Dashed line Color
        layer.lineDashPattern = [3, 6]; // Here you set line length
        
        if isVertical {
            layer.transform = CATransform3DMakeRotation(CGFloat(rad(180)), viewWidth/2, viewHeight/2, 1.0)
        }
        
        self.layer.addSublayer(layer)
    }
    
    func rad(_ value: Double) -> Double {
        return (value * Double.pi) / 180
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}

//@IBDesignable extension UIView {
//    @IBInspectable var borderColor:UIColor? {
//        set {
//            layer.borderColor = newValue!.cgColor
//        }
//        get {
//            if let color = layer.borderColor {
//                return UIColor(cgColor:color)
//            }
//            else {
//                return nil
//            }
//        }
//    }
//    @IBInspectable var borderWidth:CGFloat {
//        set {
//            layer.borderWidth = newValue
//        }
//        get {
//            return layer.borderWidth
//        }
//    }
//    @IBInspectable var cornerRadius:CGFloat {
//        set {
//            layer.cornerRadius = newValue
//            clipsToBounds = newValue > 0
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//}

