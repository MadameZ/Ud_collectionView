//
//  MyCollectionCell2.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 02/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MyCollectionCell2: UICollectionViewCell {
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var flagIv: ShadowView!
    
 
    var country: Country!
    
    func setupCell(country: Country) {
        
        self.country = country
        
        // le self avant countryLbl et flagIv ne sont pas obligatoires
        // le self avant country permet de nous référer à var country et par au paramètre
        self.countryLbl.text = self.country.name
        self.flagIv.image = self.country.flag
        
        contentView.layer.cornerRadius = 25
        contentView.backgroundColor = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)
    }
    
}
