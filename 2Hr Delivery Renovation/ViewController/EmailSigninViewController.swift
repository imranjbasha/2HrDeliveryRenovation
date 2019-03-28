//
//  EmailSigninViewController.swift
//  2Hr Delivery Renovation
//
//  Created by Mitosis on 12/03/19.
//  Copyright © 2019 Mitosis. All rights reserved.
//

import UIKit

class EmailSigninViewController: UIViewController {


    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    @IBAction func btnLogin(_ sender: Any) {
        if self.tfUserName.text == nil || self.tfUserName.text == "" {
            self.tfUserName.shake()
        } else if self.tfPwd.text == nil || self.tfPwd.text == "" {
            self.tfPwd.shake()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 8.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 8.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
