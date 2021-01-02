//
//  Brand.swift
//  TrendyolFake
//
//  Created by Bekir on 19.12.2020.
//

import Foundation

class  Brand {
    var iD:Int?
    var brandName:String?
    var imageName:String?
    
    init(id:Int,brandName:String,imageName:String) {
        self.iD = id
        self.brandName = brandName
        self.imageName = imageName
    }
}
