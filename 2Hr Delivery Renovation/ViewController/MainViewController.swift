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
        //NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        openSideMenuWithAnimations()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     //   NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)

        // Do any additional setup after loading the view.
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
    
    /*@objc func toggleSideMenu() {
        if isSlideMenuOpen {
            layoutContraint.constant = -240
            isSlideMenuOpen = false
        }else {
            layoutContraint.constant = 0
            isSlideMenuOpen = true
        }
    }*/
    
    func openSideMenuWithAnimations(){
        //layoutContraint.constant = 0
        /*UIView.animate(withDuration: 0.7, animations: { () -> Void in
            var frameMenu : CGRect = self.menuView.frame
            frameMenu.origin.x = 1 * UIScreen.main.bounds.size.width
            self.menuView.frame = frameMenu
            self.menuView.layoutIfNeeded()
            self.menuView.backgroundColor = UIColor.clear
        }, completion: nil)*/
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
        /*layoutContraint.constant = -240
        UIView.animate(withDuration: 0.7
            , animations: {
                () -> Void in
                self.menuView.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.menuView.layoutIfNeeded()
                self.menuView.backgroundColor = UIColor.clear
        })*/
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
