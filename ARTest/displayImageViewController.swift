//
//  displayImageViewController.swift
//  ARTest
//
//  Created by 福山帆士 on 2020/07/25.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import UIKit

class displayImageViewController: UIViewController {
    
    var cgImage: CGImage!
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ]
        
        NSLayoutConstraint.activate(imageViewConstraints)
        
        
        imageSet(cgimage: cgImage)
        
        
        // Do any additional setup after loading the view.
    }
    
    func imageSet(cgimage: CGImage) {
        
        let image = UIImage(cgImage: cgimage)
        imageView.image = image
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
