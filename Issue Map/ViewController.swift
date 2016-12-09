//
//  ViewController.swift
//  Issue Map
//
//  Created by Ronald Martin on 12/9/16.
//  Copyright © 2016 Ronald Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var bottomSheet: UIView!
    
    @IBOutlet private weak var bottomSheetTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bottomSheet.layer.cornerRadius = 8
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSheetGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: bottomSheet)
        let duration = TimeInterval(translation.y / sender.velocity(in: bottomSheet).y)
        
        UIView.animate(
            withDuration: duration,
            animations: {
                self.bottomSheetTopConstraint.constant += translation.y
                self.bottomSheet?.setNeedsLayout()
        },
            completion: { finished in
                sender.setTranslation(CGPoint.zero, in: self.bottomSheet)
        })
        
    }

}

