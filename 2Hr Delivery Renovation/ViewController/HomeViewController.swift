//
//  HomeViewController.swift
//  2Hr Delivery Renovation
//
//  Created by Mitosis on 12/03/19.
//  Copyright © 2019 Mitosis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var productsList: UICollectionView!
    let productsNamesList : [String] = ["Apple", "orange", "grape", "mango", "pomagranete", "sapota", "fig", "papaya", "banana", "pine apple"]
    let productsPriceList : [String] = ["20", "25", "15", "30", "35", "15", "40", "20", "25", "30"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productsList.dataSource = self
        self.productsList.delegate = self
        self.productsList.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeViewCell")

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
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return self.productsNamesList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCell", for: indexPath) as! HomeViewCell
        cell.namelbl.text = self.productsNamesList[indexPath.row]
        cell.varientlbl.text = self.productsPriceList[indexPath.row]
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print(indexPath)
    }
}
