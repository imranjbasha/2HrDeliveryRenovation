//
//  MainViewController.swift
//  2Hr Delivery Renovation
//
//  Created by Mitosis on 20/03/19.
//  Copyright © 2019 Mitosis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var isSlideMenuOpen = false

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var layoutContraint: NSLayoutConstraint!
    
    @IBAction func onMenuTapped(_ sender: Any) {
        openSideMenuWithAnimations()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                openSideMenuWithAnimations()
            case UISwipeGestureRecognizer.Direction.left:
                closeSideMenu()
            default:
                break
            }
        }
    }
    
    func openSideMenuWithAnimations(){
        if self.isSlideMenuOpen == false {
        let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        }, completion: { (finished) -> Void in
            self.isSlideMenuOpen = true
        })
        }
    }
    
    func closeSideMenu(){
        if self.isSlideMenuOpen == true {
            
        let viewMenuBack : UIView = view.subviews.last!
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            var frameMenu : CGRect = viewMenuBack.frame
            frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
            viewMenuBack.frame = frameMenu
            viewMenuBack.layoutIfNeeded()
            viewMenuBack.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            viewMenuBack.removeFromSuperview()
            self.isSlideMenuOpen = false
        })
        }
    }
}
