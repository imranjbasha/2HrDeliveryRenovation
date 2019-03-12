//
//  FirstViewController.swift
//  2Hr Delivery Renovation
//
//  Created by Mitosis on 12/03/19.
//  Copyright © 2019 Mitosis. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func onStart(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeWithoutSignin") as! HomeViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
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
