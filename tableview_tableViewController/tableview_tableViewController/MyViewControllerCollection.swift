//
//  MyViewControllerCollection.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 02/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MyViewControllerCollection: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    var countries: [Country] = CountryGetter().getAllCountries()
    
    var selectedCountries: [Country] = []
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchbar.delegate = self
        
        // Si on écrit 3 - 30 on aura des éléments qui rentrent par 3 dans une cellule :
        let width = collectionView.frame.width / 2 - 30
        
        // Pour le header comme il est nil on ne le verra pas à l'écran :
        collectionView.collectionViewLayout = MyFlowLayout(
            size: CGSize(width: width, height: width),
            lineSpacing: 20,
            itemSpacing: 10,
            direction: .vertical,
            headerSize: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "collectionPop", let next = segue.destination as? DetailViewController {
              next.country = sender as? Country

        }
    }
    
}



extension MyViewControllerCollection: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // condition pour la searchBar:
        return isSearching ? selectedCountries.count : countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // On crée aussi le fichier MyCollectionViewCell2 qui est une UICollectionViewCell
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection2", for: indexPath) as? MyCollectionCell2 {
            
            let country = isSearching ? selectedCountries[indexPath.item] : countries[indexPath.item]
            cell.setupCell(country: country)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let country = isSearching ? selectedCountries[indexPath.item] : countries[indexPath.item]
        
        performSegue(withIdentifier: "collectionPop", sender: country)
    }
    
}

extension MyViewControllerCollection: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // Le clavier se ferme :
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
            collectionView.reloadData()
        } else {
            isSearching = true
   
            // $0 : on passe à travers chaque élément
            selectedCountries = countries.filter({$0.name.lowercased().contains(searchText.lowercased())})
                
            // puis on recharge la collectionView :
            collectionView.reloadData()
       
        }
    }
}
