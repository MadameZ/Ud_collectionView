//
//  MyCollectionController.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 02/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collection1"

class MyCollectionController: UICollectionViewController {

    var countries: [Country] = CountryGetter().getAllCountries()
    var continents: [Continent] = CountryGetter().getContinents()
    var countrySelected: Country?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
/*
         Pour dessinner la cellule dans le viewDidLoad directement :
         
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 150, height: 150)
        
        // espacement par ligne :
        layout.minimumLineSpacing = 45
        // par rapport aux éléments qui sont sur la même ligne :
        layout.minimumInteritemSpacing = 20
        // direction du scroll :
        layout.scrollDirection = .horizontal
 */
    
        collectionView.collectionViewLayout = MyFlowLayout(
            size: CGSize(width: 150, height: 150),
            lineSpacing: 45,
            itemSpacing: 20,
            direction: .vertical,
            headerSize: CGSize(width: collectionView.frame.width, height: 75))
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "collectionPush", let next = segue.destination as? DetailViewController {
            next.country = countrySelected
        }
        
    }
    

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // Si on n'a qu'une section (sans continents) :
        // return 1
        
        return continents.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // équivalent à numberOfRowsInSection d'une tableView
        
        // Sans section :
        // return countries.count
        
        // Avec section :
        return continents[section].countries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Configure the cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MycollectionCell1 {
            
            // Sans section :
            // cell.country = countries[indexPath.item]
            
            // Avec section :
            cell.country = continents[indexPath.section].countries[indexPath.item]
            
            return cell
            
        }

        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Sans section :
        // countrySelected = countries[indexPath.item]
        
        // Avec Section :
        countrySelected = continents[indexPath.section].countries[indexPath.item]
        
        performSegue(withIdentifier: "collectionPush", sender: nil)
    }
    
    //MARK: - Header

    /// pour l'implémentation on commence à écrire supplementaryElementofKind
    /// Il faut donner une tailler au header dans MyFlowLayout
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderReusableView
            header.str = continents[indexPath.section].name
            
            return header
            
            
        default: return UICollectionReusableView()
        }
        
        
    }
   

}
