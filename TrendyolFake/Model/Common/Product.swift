//
//  Product.swift
//  TrendyolFake
//
//  Created by Bekir on 20.12.2020.
//

import Foundation

class  Product {
    var brand:String?
    var iD:Int?
    var brandId:Int?
    var subCategoryId:Int?
    var productName:String?
    var imageName:String?
    var price:Double?
    
    init(id:Int,brandId:Int,brand:String,subCategoryId:Int,productName:String,imageName:String,price:Double) {
        self.brand = brand
        self.iD = id
        self.brandId = brandId
        self.subCategoryId = subCategoryId
        self.productName = productName
        self.imageName = imageName
        self.price = price
    }
}
