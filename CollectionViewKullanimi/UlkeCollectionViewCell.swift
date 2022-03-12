//
//  UlkeCollectionViewCell.swift
//  CollectionViewKullanimi
//
//  Created by Furkan Erzurumlu on 10.03.2022.
//


import UIKit

protocol HucreProtocol {
    func buttonTiklandi(indexPath:IndexPath)
}

class UlkeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ulkeLabel: UILabel!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    @IBAction func secButton(_ sender: Any) {
        hucreProtocol?.buttonTiklandi(indexPath: indexPath!)
        
    }
    
}
