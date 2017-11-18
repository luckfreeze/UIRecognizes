//
//  ViewController.swift
//  UIPan
//
//  Created by Lucas Moraes on 03/03/17.
//  Copyright © 2017 Lucas Moraes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var MyView: UIView!
    @IBOutlet weak var MyView2: UIView!
    @IBOutlet weak var MyView3: UIView!
    
    @IBOutlet weak var labelX: UILabel!
    @IBOutlet weak var labelY: UILabel!
    
    var kappa = false
    
    let wineColor = UIColor(red: 137, green: 20, blue: 50, alpha: 1) // Nice Wine Color
    let NiceBlue = UIColor(red: 9, green: 64, blue: 129, alpha: 1) // Nice Blue Color
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "GestReco"
        
    }
    
    
    @IBAction func MyPanGes(_ sender: UIPanGestureRecognizer) {
        let myView = sender.view!
        let point = sender.translation(in: view)
        myView.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        self.labelX.text = String(describing: view.center.x + point.x)
        self.labelY.text = String(describing: view.center.y + point.y)

        if sender.state == UIGestureRecognizerState.ended {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
                myView.center = self.view.center
            }, completion: nil)

            self.labelX.text = String(describing: view.center.x)
            self.labelY.text = String(describing: view.center.y)
        }
    }
    
    @IBAction func MyPinchGes(_ sender: UIPinchGestureRecognizer) {
        let myView = sender.view!
        sender.delegate = self
        myView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
        if sender.state == UIGestureRecognizerState.ended {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
                myView.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    @IBAction func MyRotGes(_ sender: UIRotationGestureRecognizer) {
        
        let myView = sender.view!
        let rotation = sender.rotation
        sender.delegate = self
    
        myView.transform = CGAffineTransform(rotationAngle: rotation)
        if sender.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
                myView.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    @IBAction func ChangeView(_ sender: UIButton) {
        if kappa == false {
            UIView.transition(from: MyView3, to: MyView2, duration: 0.7, options: [.transitionFlipFromTop,
                                                                                   .showHideTransitionViews], completion: nil)
            //updateBar()
            kappa = true
        } else if kappa == true {
            UIView.transition(from: MyView2, to: MyView3, duration: 0.7, options: [.transitionFlipFromBottom, .showHideTransitionViews], completion: nil)
            //updateBar()
            kappa = false
        }
    }
    
    @IBAction func goNext(_ sender: AnyObject){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

















