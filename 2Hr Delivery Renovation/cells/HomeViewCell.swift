//
//  HomeViewCell.swift
//  2HRGroceryCustomerApp
//
//  Created by Sathiyan Sivaprakasam on 05/05/18.
//  Copyright © 2018 Sathiyan Sivaprakasam. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {

  
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
      //  setupDropDowns()
        // Initialization code
        
    }

}
