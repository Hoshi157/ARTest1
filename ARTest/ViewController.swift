//
//  ViewController.swift
//  ARTest
//
//  Created by 福山帆士 on 2020/07/25.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import UIKit
import RealityKit
import ARKit
import VideoToolbox

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    private var cgImage: CGImage?
    
    private let trakButton: UIButton = {
        let button = UIButton()
        button.setTitle("trak", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.addTarget(self, action: #selector(trakButtonPressid), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trakButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trakButton)
        
        let trakButtonConstraints = [
            trakButton.heightAnchor.constraint(equalToConstant: 50),
            trakButton.widthAnchor.constraint(equalToConstant: 200),
            trakButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trakButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ]
        
        NSLayoutConstraint.activate(trakButtonConstraints)
        
        arView.debugOptions.insert(.showSceneUnderstanding)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        remove()
    }
    
    @objc func trakButtonPressid() {
        
        traking()
    }
    
    func setup() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.sceneReconstruction = .mesh
        arView.session.run(configuration)
    }
    
    func remove() {
        arView.session.pause()
    }
    
    func traking() {
        guard let frame = arView.session.currentFrame else { fatalError() }
        
        let captureImage = frame.capturedImage
        
        VTCreateCGImageFromCVPixelBuffer(captureImage, options: nil, imageOut: &cgImage)
        
        if let _cgImage = cgImage {
            let displayImageVC = displayImageViewController()
            displayImageVC.cgImage = _cgImage
            displayImageVC.modalPresentationStyle = .fullScreen
            present(displayImageVC, animated: true)
        }
        
    }
}
