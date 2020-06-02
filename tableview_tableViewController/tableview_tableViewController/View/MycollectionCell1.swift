//
//  MycollectionCell1.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 02/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MycollectionCell1: UICollectionViewCell {
    
    @IBOutlet weak var roundedIv: RoundedImage!
    
    var country: Country! {
        didSet {
            roundedIv.image = country.flag
            roundedIv.updateRadius(radius: frame.width / 2)
        }
    }
    
}
