//
//  FavoriteCell.swift
//  TrendyolFake
//
//  Created by Bekir on 20.12.2020.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    var favoriteProductList:[Product]?
    @IBOutlet weak var clvFavorite: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clvFavorite.delegate = self
        clvFavorite.dataSource = self
        favoriteProductList = BaseData.sharedInstance.getFavoriteList()
        clvFavorite.reloadData()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(favoriteListChange), name: Notification.Name("ChangeFavoriteProduct"), object: nil)
        // Initialization code
    }
    
    @objc func favoriteListChange()  {
        favoriteProductList = BaseData.sharedInstance.getFavoriteList()
        clvFavorite.reloadData()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension FavoriteCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteProductList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionCell", for: indexPath as IndexPath) as! FavoriteCollectionCell
        cell.imgFavoriteProduct.image = UIImage.init(named: favoriteProductList![indexPath.row].imageName!)    
        return cell
    }
    
    
}
