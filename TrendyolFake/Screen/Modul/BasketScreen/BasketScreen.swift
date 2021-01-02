//
//  BasketScreen.swift
//  TrendyolFake
//
//  Created by ASIMCAN EKŞİOĞLU on 1.01.2021.
//

import UIKit

class BasketScreen: UIViewController {

    @IBOutlet weak var tbvBasketList: UITableView!
    @IBOutlet weak var lblTotalPrice: UILabel!
    var totalPrice : Double = 0.0
    var listBasketProduct: [BasketProduct] = [BasketProduct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listBasketProduct = BasketData.sharedInstance.getBasketProductList()
        tbvBasketList.reloadData()
        
        // Do any additional setup after loading the view.
    }
}

extension BasketScreen: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return listBasketProduct.count
}
    func basketTotalPrice() {
        totalPrice = 0.0
        for basketProduct in listBasketProduct {
            totalPrice = totalPrice + (Double(basketProduct.count) * (basketProduct.product?.price)!)
        }
        lblTotalPrice.text = "\(totalPrice)"
        
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTBVCell", for: indexPath as IndexPath) as! BasketTBVCell
let image = listBasketProduct[indexPath.row].product?.imageName ?? "Product"
cell.imgProduct.image = UIImage(named: image)
cell.lblBrand.text = listBasketProduct[indexPath.row].product?.brand
cell.lblTitle.text = listBasketProduct[indexPath.row].product?.productName
cell.lblPrice.text = "\(listBasketProduct[indexPath.row].product?.price)"

return cell
}
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
if editingStyle == .delete {
    BasketData.sharedInstance.removeProductBasket(basketProduct: self.listBasketProduct[indexPath.row])
   listBasketProduct.remove(at: indexPath.row)
    tbvBasketList.deleteRows(at: [indexPath], with: .fade)
    basketTotalPrice()
    
    let nc = NotificationCenter.default
    nc.post(name: Notification.Name("DeleteBasketProduct"), object: nil)
    
}
}
}




