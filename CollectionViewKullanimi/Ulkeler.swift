//
//  Ulkeler.swift
//  CollectionViewKullanimi
//
//  Created by Furkan Erzurumlu on 10.03.2022.
//

import Foundation

class Ulkeler {
    var ulkeID:Int?
    var ulkeAd:String?
    var ulkeBaskent:String?
    
    init() {
        
    }
    
    init(ulkeID:Int,ulkeAd:String,ulkeBaskent:String) {
        self.ulkeID = ulkeID
        self.ulkeAd = ulkeAd
        self.ulkeBaskent = ulkeBaskent
    }
}
