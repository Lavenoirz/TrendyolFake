//
//  BrandDetailScreen.swift
//  TrendyolFake
//
//  Created by Bekir on 19.12.2020.
//

import UIKit

class BrandDetailScreen: BaseScreen {

    @IBOutlet weak var clvProduct: UICollectionView!
    @IBOutlet weak var clvSubCategory: UICollectionView!
    var subCategoryList:[SubCategory]?
    
    var productList:[Product]?
    var filterProductList:[Product]?

    var brand:Brand?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Network.getCategoryList { [weak self](subCategoryList) in
            self?.subCategoryList = subCategoryList
            self?.clvSubCategory.reloadData()
        }

        Network.getProductList(brandId: brand?.iD ?? 0) { [weak self] (productList) in
            self?.productList = productList
            self?.filterProductList = productList
            self?.clvProduct.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }


}

extension BrandDetailScreen: AddToBasketDelegate {
    func addToBasket(product: Product) {
        ActionSheet.init(view: self, product: product)
    }
}


extension BrandDetailScreen: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(clvProduct == collectionView){
            return filterProductList?.count ?? 0
        }else if(clvSubCategory == collectionView){
            return subCategoryList?.count ?? 0
        }
        
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(clvSubCategory == collectionView){
            if(self.subCategoryList![indexPath.row].iD == 0){
                self.filterProductList = self.productList
            }else {
                self.filterProductList = productList?.filter{
                    $0.subCategoryId == self.subCategoryList![indexPath.row].iD
                }
            }
            self.clvProduct.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(clvProduct == collectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentify.ProductCell, for: indexPath as IndexPath) as! ProductCell
            cell.lblBrandName.text = self.filterProductList?[indexPath.row].brand
            cell.imgProduct.image = UIImage.init(named: self.filterProductList?[indexPath.row].imageName ?? "")
            cell.lblProductName.text = self.filterProductList?[indexPath.row].productName
            cell.lblPrice.text = "\((self.filterProductList?[indexPath.row].price)!) TL"
            cell.setData(product: self.filterProductList![indexPath.row])
            cell.addToBasketDelegate = self
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentify.SubcategoryCell, for: indexPath as IndexPath) as! SubcategoryCell
            cell.lblSubcategory.text = (subCategoryList?[indexPath.row].categoryName) ?? ""
            return cell
        }
    }
    
    
}
