//
//  learnASL.swift
//  gesture
//
//  Created by Sarthak Mangla on 2/25/23.
//

import UIKit
import RealityKit
import ARKit
import AVFoundation

var captureSession: AVCaptureSession!
var stillImageOutput: AVCapturePhotoOutput!
var videoPreviewLayer: AVCaptureVideoPreviewLayer!


class learnASL: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, ARSessionDelegate {

    @IBOutlet weak var letterPicker: UIPickerView!
    @IBOutlet weak var detectButtonASL: UIButton!
    @IBOutlet var arView: ARSCNView!
    
    func classifyARFrame() {
        do {
            let model = try VNCoreMLModel(for: detect().model)
//            print(model.features)
            var request = VNCoreMLRequest(model: model, completionHandler: myResultsMethod)
            let handler = VNImageRequestHandler(cvPixelBuffer: arView.session.currentFrame!.capturedImage, orientation: .left)
            try handler.perform([request])
        } catch {
            print("failed v2 \(error)")
        }
    }

    func myResultsMethod(request: VNRequest, error: Error?) {
        guard let results = request.results as? [VNRecognizedObjectObservation]
            else { fatalError("huh") }
        for classification in results {
            print(classification.labels[0])
            print(classification.confidence)
            print(classification)
            print(classification.boundingBox)
//            arView.scene.rootNode.addChildNode(classification.boundingBox)
            

            
//            let bounding_box = SCNGeometry.line(from: SCNVector3(classification.boundingBox[0], classification.boundingBox[1], 0), to: SCNVector3(classification.boundingBox[2], classification.boundingBox[3], 0))
            
            
        }
    }

    @IBAction func detectImage(_ sender: UIButton) {
        print("hellooooo button pressed")
        let frame = arView.session.currentFrame
        let pixelBufImage = frame?.capturedImage
        classifyARFrame()
    }
    var pickerData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black;
        

        arView.session.delegate = self
        arView.session.run(ARFaceTrackingConfiguration());
        
        pickerData = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        self.letterPicker.delegate = self
        self.letterPicker.dataSource = self
        
//        let model = detect()
//        model.prediction(image: <#T##CVPixelBuffer#>)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Number of columns of data
    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return pickerData[row]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
