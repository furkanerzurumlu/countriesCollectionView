//
//  ViewController.swift
//  CollectionViewKullanimi
//
//  Created by Furkan Erzurumlu on 10.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ulkelerCollectionView: UICollectionView!
    
    var ulkelerList = [Ulkeler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 5
        tasarim.minimumLineSpacing = 5
        let genislik = self.ulkelerCollectionView.frame.size.width
        tasarim.itemSize = CGSize(width: (genislik-25)/2, height: (genislik-25)/2)
        ulkelerCollectionView.collectionViewLayout = tasarim
        
        ulkelerCollectionView.delegate = self
        ulkelerCollectionView.dataSource = self
        let u1 = Ulkeler(ulkeID: 1, ulkeAd: "Türkiye", ulkeBaskent: "Ankara")
        let u2 = Ulkeler(ulkeID: 2, ulkeAd: "Fransa", ulkeBaskent: "Paris")
        let u3 = Ulkeler(ulkeID: 3, ulkeAd: "İtalya", ulkeBaskent: "Roma")
        let u4 = Ulkeler(ulkeID: 4, ulkeAd: "ingiltere", ulkeBaskent: "Londra")
        let u5 = Ulkeler(ulkeID: 5, ulkeAd: "Japonya", ulkeBaskent: "Tokyo")
        ulkelerList.append(u1)
        ulkelerList.append(u2)
        ulkelerList.append(u3)
        ulkelerList.append(u4)
        ulkelerList.append(u5)
    }
}



extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,HucreProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ulkelerList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ulke = ulkelerList[indexPath.row]
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ulkeHucre", for: indexPath) as! UlkeCollectionViewCell
        cell.ulkeLabel.text = ulke.ulkeAd
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 10
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ulke = ulkelerList[indexPath.row]
        print("\(ulke.ulkeAd!) seçildi")
        performSegue(withIdentifier: "toDetay", sender: ulke)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            let ulke = sender as? Ulkeler
            let gidilecekVC = segue.destination as! detayVC
            gidilecekVC.ulke = ulke
        }
    }
    
    func buttonTiklandi(indexPath: IndexPath) {
        let ulke = ulkelerList[indexPath.row]
        print("Button ile \(ulke.ulkeAd!) seçildi")
    }
}
