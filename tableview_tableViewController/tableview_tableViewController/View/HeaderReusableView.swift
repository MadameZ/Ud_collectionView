//
//  HeaderReusableView.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 02/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit


// Dans le storyboard, on rajoute avant une "collection reusable view" dans notre collection View

class HeaderReusableView: UICollectionReusableView {
        
    @IBOutlet weak var headerLbl: UILabel!
    
    var str: String! {
        didSet {
            headerLbl.text = str
        }
    }
}
