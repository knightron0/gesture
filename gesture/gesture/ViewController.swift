//
//  ViewController.swift
//  gesture
//
//  Created by Sarthak Mangla on 2/24/23.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
//    @IBOutlet var arView: ARView!
    
    @IBOutlet weak var interpretASL: UIButton!
    @IBOutlet weak var viewASL: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black;
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
        
        interpretASL.backgroundColor = UIColor(red: CGFloat(97)/255.0, green: CGFloat(115)/255.0, blue: CGFloat(150)/255.0, alpha: 1)
        interpretASL.layer.cornerRadius = 10
        
        viewASL.backgroundColor = UIColor(red: CGFloat(97)/255.0, green: CGFloat(115)/255.0, blue: CGFloat(150)/255.0, alpha: 1)
        viewASL.layer.cornerRadius = 10
    }
}
