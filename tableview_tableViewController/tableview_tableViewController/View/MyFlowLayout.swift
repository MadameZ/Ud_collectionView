//
//  MyFlowLayout.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 02/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MyFlowLayout: UICollectionViewFlowLayout {

    // notre init de façon programmatique :
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(size: CGSize, lineSpacing: CGFloat, itemSpacing: CGFloat, direction: UICollectionView.ScrollDirection, headerSize: CGSize?) {
        super.init()
        itemSize = size
        // espacement par ligne :
        minimumLineSpacing = lineSpacing
        // par rapport aux éléments qui sont sur la même ligne :
        minimumInteritemSpacing = itemSpacing
        // direction du scroll :
        scrollDirection = direction
        // pour les dimensions du header :
        headerReferenceSize = headerSize ?? CGSize(width: 0, height: 0)
    }
   
    
}
