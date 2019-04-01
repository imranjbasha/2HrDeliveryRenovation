//
//  HomeViewController.swift
//  2Hr Delivery Renovation
//
//  Created by Mitosis on 12/03/19.
//  Copyright © 2019 Mitosis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBAction func btnMisc(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GroceryViewController") as! GroceryViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    @IBAction func btnGrocery(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GroceryViewController") as! GroceryViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    @IBOutlet weak var popularProductsList: UICollectionView!
    @IBOutlet weak var productsList: UICollectionView!
    let productsNamesList : [String] = ["Apple", "orange", "grape", "mango", "pomagranete", "sapota", "fig", "papaya", "banana", "pine apple"]
    let productsPriceList : [String] = ["20", "25", "15", "30", "35", "15", "40", "20", "25", "30"]
    let popularProductsNamesList : [String] = ["Rice", "Wheat", "Dhal", "Tomato", "Onion", "Carrot", "Beetroot", "Potato", "Brinjal", "Beans"]
    let popularProductsPriceList : [String] = ["50", "30", "10", "19", "15", "15", "20", "25", "20", "35"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productsList.dataSource = self
        self.productsList.delegate = self
        self.productsList.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeViewCell")
        self.popularProductsList.dataSource = self
        self.popularProductsList.delegate = self
        self.popularProductsList.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeViewCell")
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
    
        return getCollectionsCount(collectionView: collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCell", for: indexPath) as! HomeViewCell
        /*cell.productName.text = self.productsNamesList[indexPath.row]
        cell.productPrice.text = self.productsPriceList[indexPath.row]
        cell.productImage.image = UIImage(named: "shoppingcart")
        return cell*/
        return setCollectionsItems(collectionView: collectionView, cell: cell, indexpath: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GroceryViewController") as! GroceryViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 135.0, height: 260.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    func getCollectionsCount(collectionView: UICollectionView) -> Int{
        var count: Int = 0
        if collectionView == self.productsList {
            count =  self.productsNamesList.count
        } else if collectionView == self.popularProductsList {
            count = self.popularProductsNamesList.count
        }
        return count
    }
    
    func setCollectionsItems(collectionView: UICollectionView, cell: HomeViewCell, indexpath: IndexPath) -> UICollectionViewCell{
        if collectionView == self.productsList {
            cell.productName.text = self.productsNamesList[indexpath.row]
            cell.productPrice.text = self.productsPriceList[indexpath.row]
            cell.productImage.image = UIImage(named: "shoppingcart")
            
        } else if collectionView == self.popularProductsList {
            cell.productName.text = self.popularProductsNamesList[indexpath.row]
            cell.productPrice.text = self.popularProductsPriceList[indexpath.row]
            cell.productImage.image = UIImage(named: "shoppingcart")
        }
        return cell
    }
}
