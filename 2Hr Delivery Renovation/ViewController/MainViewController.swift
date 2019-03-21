//
//  MainViewController.swift
//  2Hr Delivery Renovation
//
//  Created by Mitosis on 20/03/19.
//  Copyright © 2019 Mitosis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func onMenuBarSelected(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu")
            , object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
