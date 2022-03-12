//
//  detayVC.swift
//  CollectionViewKullanimi
//
//  Created by Furkan Erzurumlu on 12.03.2022.
//

import UIKit

class detayVC: UIViewController {

    @IBOutlet weak var ulkeLabel: UILabel!
    @IBOutlet weak var baskentLabel: UILabel!
    
    var ulke:Ulkeler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let u = ulke {
            ulkeLabel.text = u.ulkeAd
            baskentLabel.text = u.ulkeBaskent
        }
    }
    
    @IBAction func vizeButton(_ sender: Any) {
        if let u = ulke {
            print("\(u.ulkeAd!) ülkesine vize başvurusu yapıldı")
        }
    }
}
