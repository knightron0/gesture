//
//  ViewController.swift
//  gesture
//
//  Created by Sarthak Mangla on 2/24/23.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var interpretASL: UIButton!
    @IBOutlet weak var viewASL: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.contents = UIImage(named: "Rectangle9.pdf")?.cgImage
        
        var circle = UILabel()

        circle.frame = CGRect(x: 0, y: 0, width: 104, height: 104)
        
        circle.layer.cornerRadius = 104/2
        
        circle.clipsToBounds = true
        
        

        circle.backgroundColor = .white


        var shadows = UIView()

        shadows.frame = circle.frame

        shadows.clipsToBounds = true

        circle.addSubview(shadows)


        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)

        let layer0 = CALayer()

        layer0.shadowPath = shadowPath0.cgPath

        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor

        layer0.shadowOpacity = 1

        layer0.shadowRadius = 4

        layer0.shadowOffset = CGSize(width: 0, height: 4)

        layer0.bounds = shadows.bounds

        layer0.position = shadows.center

        shadows.layer.addSublayer(layer0)


        var shapes = UIView()

        shapes.frame = circle.frame

        shapes.clipsToBounds = true

        circle.addSubview(shapes)


        let layer1 = CALayer()

        layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor

        layer1.bounds = shapes.bounds

        layer1.position = shapes.center

        shapes.layer.addSublayer(layer1)



        var parent = self.view!

        parent.addSubview(circle)

        circle.translatesAutoresizingMaskIntoConstraints = false

        circle.widthAnchor.constraint(equalToConstant: 104).isActive = true

        circle.heightAnchor.constraint(equalToConstant: 104).isActive = true

        circle.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true

        circle.topAnchor.constraint(equalTo: parent.topAnchor, constant: 179).isActive = true
        
        // Ellipse 1


        var colorElipse = UIImageView(image: UIImage(named: "Hand"))
        
        colorElipse.frame = CGRect(x: 0, y: 0, width: 88, height: 88)
            
        colorElipse.layer.cornerRadius = 88/2
        
        colorElipse.clipsToBounds = true
        
        colorElipse.backgroundColor = .white
        
        colorElipse.center = circle.center
        
        circle.addSubview(colorElipse)
        
        let logoText = UILabel()
        logoText.text = "gesture"
        logoText.font = UIFont(name: "Avenir-Medium", size: 40)
        
        view.addSubview(logoText)
        logoText.translatesAutoresizingMaskIntoConstraints = false
        logoText.textAlignment = .center
        NSLayoutConstraint.activate([
            logoText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoText.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140),
            logoText.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        

        
        interpretASL.backgroundColor = UIColor.clear
        interpretASL.layer.cornerRadius = 10
        interpretASL.layer.borderWidth = 3
        interpretASL.layer.borderColor = UIColor.white.cgColor
        interpretASL.layer.masksToBounds = false
    
        viewASL.backgroundColor = .clear
        viewASL.layer.cornerRadius = 10
        viewASL.layer.borderWidth = 3
        viewASL.layer.borderColor = UIColor.white.cgColor
    }
}
