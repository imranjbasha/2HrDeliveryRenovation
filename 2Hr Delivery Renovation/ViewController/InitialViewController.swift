//
//  InitialViewController.swift
//  2Hr Delivery Renovation
//
//  Created by Mitosis on 20/03/19.
//  Copyright © 2019 Mitosis. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var isSlideMenuOpen = false

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu)
            , name: NSNotification.Name("ToggleSideMenu"), object: nil)

    }
    
    @objc func toggleSideMenu() {
        if isSlideMenuOpen {
            sideMenuConstraint.constant = -240
            isSlideMenuOpen = false
        }else {
            sideMenuConstraint.constant = 0
            isSlideMenuOpen = true
        }
        
        UIView.animate(withDuration: 0.5
            , animations: {
                UIView.setAnimationTransition(UIView.AnimationTransition.flipFromLeft
                    , for: self.view, cache: true)
        }, completion: nil)
        
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
