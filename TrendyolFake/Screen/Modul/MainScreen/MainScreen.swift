//
//  MainScreen.swift
//  TrendyolFake
//
//  Created by Bekir on 19.12.2020.
//

import UIKit

class MainScreen: BaseScreen {

    @IBOutlet weak var tbvBrandList: UITableView!
    
    var brandList:[Brand]?
    
    var selectedBrand:Brand?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(favoriteListChange), name: Notification.Name("ChangeFavoriteProduct"), object: nil)

        Network.getHomePageData {[weak self] (brandList) in
            self?.brandList = brandList
            self?.tbvBrandList.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVc = segue.destination as? BrandDetailScreen{
            destVc.brand = selectedBrand
        }
    }
    
    
    @objc func favoriteListChange()  {
        tbvBrandList.reloadData()
    }


}


extension MainScreen: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(BaseData.sharedInstance.getFavoriteList().count > 0){
            return brandList!.count+1

        }
        return brandList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0 && BaseData.sharedInstance.getFavoriteList().count > 0){
            let cell:FavoriteCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
            return cell
        }else {
            let cell:BrandCell = tableView.dequeueReusableCell(withIdentifier: CellIdentify.BrandCell, for: indexPath) as! BrandCell
            
            if(BaseData.sharedInstance.getFavoriteList().count > 0){
                cell.imgBrand.image = UIImage.init(named: (brandList![indexPath.row-1].imageName) ?? "")
            }else{
                cell.imgBrand.image = UIImage.init(named: (brandList![indexPath.row].imageName) ?? "")
            }
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0 && BaseData.sharedInstance.getFavoriteList().count > 0){
            return 310.0
        }
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(BaseData.sharedInstance.getFavoriteList().count > 0){
            self.selectedBrand = brandList![indexPath.row-1]
            performSegue(withIdentifier: "showBrandDetailScreen", sender: nil)
        }else{
            self.selectedBrand = brandList![indexPath.row]
            performSegue(withIdentifier: "showBrandDetailScreen", sender: nil)
        }
    }
    
}

