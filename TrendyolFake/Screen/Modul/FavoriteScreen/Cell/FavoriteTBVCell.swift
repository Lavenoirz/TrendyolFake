//
//  FavoriteTBVCell.swift
//  TrendyolFake
//
//  Created by Bekir on 27.12.2020.
//

import UIKit

protocol AddToBasketDelegate: class {
    func addToBasket(product:Product)
}

class FavoriteTBVCell: UITableViewCell {

    var product:Product?
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    weak var addToBasketDelegate:AddToBasketDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onClickAddBasket(_ sender: Any) {
        if(addToBasketDelegate != nil){
            addToBasketDelegate?.addToBasket(product: product!)
        }
    }
    
}
