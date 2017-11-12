//
//  UIViewClass.swift
//  UIPan
//
//  Created by Lucas Moraes on 17/06/17.
//  Copyright © 2017 Lucas Moraes. All rights reserved.
//

import UIKit

@IBDesignable
class myUIView: UIView {
    
    @IBInspectable var cornerR: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerR
        }
    }
}
