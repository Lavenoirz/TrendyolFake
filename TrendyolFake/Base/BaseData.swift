//
//  BaseData.swift
//  TrendyolFake
//
//  Created by Bekir on 19.12.2020.
//

import Foundation
class BaseData {
    
    static var sharedInstance = BaseData()
    
    private init(){
        
    }
    
    
    private var favoriteList:[Product] = [Product]()
    
    
    func getFavoriteList() -> [Product] {
        return favoriteList
    }
    
    
    func addFavoriteProduct(product:Product)  {
        if(!isProductFavorite(productId: product.iD!)){
            favoriteList.append(product)
        }
    }
    
    func removeFavoriteProduct(product:Product) {
        var removeIndex = -1
        for (index,item) in favoriteList.enumerated(){
            if(item.iD == product.iD){
                removeIndex = index
            }
        }
        
        if(removeIndex != -1){
            favoriteList.remove(at: removeIndex)
        }
    }
    
    
    func isProductFavorite(productId:Int) -> Bool {
        for product in favoriteList {
            if(product.iD == productId){
                return true
            }
        }
        return false
    }
    
}
enum PaymentType {
    case cash
    case card
    case onDelivery
}

class BasketData {
    static var sharedInstance = BasketData.init()
    var paymentType:PaymentType?
    private init() {
        }
    
    private var basketProductList:[BasketProduct] = [BasketProduct]()
    
    func getBasketProductList() -> [BasketProduct] {
        return basketProductList
    }
    
    func addProductBasket(basketProduct:BasketProduct) {
        
        var isAddedBefore:Bool = false
        
        for (index,item) in basketProductList.enumerated() {
            
            if(item.product?.iD == basketProduct.product?.iD){
                
                basketProductList[index].count = basketProductList[index].count + basketProduct.count
                isAddedBefore = true
                
            }
        }
        if(isAddedBefore == false) {
            basketProductList.append(basketProduct)
        }
    }
    func removeProductBasket(basketProduct:BasketProduct) {
     var indexItem = 0
        for (index,item) in basketProductList.enumerated() {
            
            if(item.product?.iD == basketProduct.product?.iD){
            indexItem = index
            }
    }
        func getBasketProduct(basketProduct:BasketProduct) -> BasketProduct? {
            var basketProductDummy: BasketProduct?
            for (index,item) in basketProductList.enumerated() {
                
                if(item.product?.iD == basketProduct.product?.iD){
            basketProductDummy = basketProductList[index]
        }
        
    }
            return basketProductDummy
    }
    
}
}
