//
//  FavoriteScreen.swift
//  TrendyolFake
//
//  Created by Bekir on 27.12.2020.
//

import UIKit

class FavoriteScreen: BaseScreen {

    @IBOutlet weak var tbvFavorite: UITableView!
    
    var favoriteList:[Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favoriteList = baseData.getFavoriteList()
        tbvFavorite.reloadData()
        
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(favoriteListChange), name: Notification.Name("ChangeFavoriteProduct"), object: nil)


        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func favoriteListChange()  {
        self.favoriteList = baseData.getFavoriteList()
        tbvFavorite.reloadData()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FavoriteScreen: AddToBasketDelegate {
    func addToBasket(product: Product) {
        ActionSheet.init(view: self,product: product)
    }
    
}


extension FavoriteScreen: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FavoriteTBVCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTBVCell", for: indexPath) as! FavoriteTBVCell
        
        cell.product = favoriteList?[indexPath.row]
        cell.lblName.text = favoriteList?[indexPath.row].productName
        cell.lblType.text = favoriteList?[indexPath.row].brand
        cell.lblPrice.text = "\((favoriteList?[indexPath.row].price)!)"
        cell.imgProduct.image = UIImage.init(named: self.favoriteList?[indexPath.row].imageName ?? "")
        cell.addToBasketDelegate = self
        return cell

    }
    
    
}
