//
//  SecondViewController.swift
//  UIPan
//
//  Created by Lucas Moraes on 17/06/17.
//  Copyright © 2017 Lucas Moraes. All rights reserved.
//

import UIKit
import CoreMotion

class SecondViewController: UIViewController {

    @IBOutlet weak var myUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavBar()
        applyMotion(myUIView, magnitude: 40)
    }

    @IBAction func goBack(_ sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
    
    func applyMotion(_ view: UIView, magnitude: Float) {
        
        let motionX = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffectType.tiltAlongHorizontalAxis)
        motionX.maximumRelativeValue = magnitude
        motionX.minimumRelativeValue = -magnitude
        
        let motionY = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffectType.tiltAlongVerticalAxis)
        motionY.maximumRelativeValue = magnitude
        motionY.minimumRelativeValue = -magnitude
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [motionX, motionY]
        
        view.addMotionEffect(group)
    }
    
    func updateNavBar() {
        self.navigationItem.title = "MotionReco"
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        }
    }
}







