//
//  Network.swift
//  TrendyolFake
//
//  Created by Bekir on 19.12.2020.
//

import Foundation

class Network {
    
    static func getHomePageData(successHandler: @escaping([Brand])->()){
        var brandList:[Brand] = [Brand]()
        brandList.append(Brand.init(id: 1, brandName: "Elle", imageName: "elle"))
        brandList.append(Brand.init(id: 2, brandName: "Mavi", imageName: "mavi"))
        brandList.append(Brand.init(id: 3, brandName: "Trendyol Milla", imageName: "trendyolmilla"))
        brandList.append(Brand.init(id: 4, brandName: "Avva", imageName: "avva"))
        brandList.append(Brand.init(id: 5, brandName: "Derimod", imageName: "derimod"))
        brandList.append(Brand.init(id: 6, brandName: "Aqua Di Polo", imageName: "aquadipolo"))
        brandList.append(Brand.init(id: 7, brandName: "Pierre Cardin", imageName: "pierrecardin"))
        brandList.append(Brand.init(id: 8, brandName: "Koton", imageName: "koton"))
        successHandler(brandList)
        
    }
    
    static func getCategoryList(successHandler: @escaping([SubCategory])->()){
        var subCategoryList:[SubCategory] = [SubCategory]()
        subCategoryList.append(SubCategory.init(id: 0, categoryName: "Tümü  "))
        subCategoryList.append(SubCategory.init(id: 1, categoryName: "T-Shirt"))
        subCategoryList.append(SubCategory.init(id: 2, categoryName: "Ceket"))
        subCategoryList.append(SubCategory.init(id: 3, categoryName: "Pantolon"))
        subCategoryList.append(SubCategory.init(id: 4, categoryName: "Sweatshirt"))
        subCategoryList.append(SubCategory.init(id: 5, categoryName: "Kazak"))
        subCategoryList.append(SubCategory.init(id: 6, categoryName: "Saat"))
        subCategoryList.append(SubCategory.init(id: 7, categoryName: "Bot"))
        subCategoryList.append(SubCategory.init(id: 8, categoryName: "Ayakkabı"))
        subCategoryList.append(SubCategory.init(id: 9, categoryName: "Eşofman"))
        subCategoryList.append(SubCategory.init(id: 10, categoryName: "Gömlek"))
        
        

        successHandler(subCategoryList)
    }
    
    static func getProductList(brandId:Int,successHandler: @escaping([Product])->()){
        var productList:[Product] = [Product]()
        // MARK: - Elle
        productList.append(Product.init(id: 1, brandId: 1, brand: "Elle", subCategoryId: 7, productName: "Unisex Siyah Chelsea Bot", imageName: "elle1",price: 89.99))
        productList.append(Product.init(id: 2, brandId: 1, brand: "Elle", subCategoryId: 8, productName: "Erkek Siyah Spor Ayakkabı", imageName: "elle2",price: 57.99))
        productList.append(Product.init(id: 3, brandId: 1, brand: "Elle", subCategoryId: 7, productName: "Kadın Siyah Topuklu Bot", imageName: "elle3",price: 159.99))
        // MARK: - Mavi
        productList.append(Product.init(id: 4, brandId: 2, brand: "Mavi", subCategoryId: 1, productName: "Kadın Siyah Çizgili Beyaz T-Shirt", imageName: "mavi1",price: 19.99))
        productList.append(Product.init(id: 5, brandId: 2, brand: "Mavi", subCategoryId: 9, productName: "Kadın Yeşil Eşofman ", imageName: "mavi2",price: 99.99))
        productList.append(Product.init(id: 6, brandId: 2, brand: "Mavi", subCategoryId: 4, productName: "Kadın Turuncu Sweatshirt", imageName: "mavi3",price: 59.99))
        // MARK: - Pierre Cardin
        productList.append(Product.init(id: 7, brandId: 7, brand: "Pierre Cardin", subCategoryId: 5, productName: "Kadın Gri Boğazlı Kazak", imageName: "pierrecardin1",price: 195.25))
        productList.append(Product.init(id: 8, brandId: 7, brand: "Pierre Cardin", subCategoryId: 5, productName: "Kadın Beyaz Boğazlı Kazak", imageName: "pierrecardin2",price: 225.99))
        productList.append(Product.init(id: 9, brandId: 7, brand: "Pierre Cardin", subCategoryId: 5, productName: "Kadın Bordo Kazak", imageName: "pierrecardin3",price: 60.25))
        // MARK: - Trendyol Milla
        productList.append(Product.init(id: 10, brandId: 3, brand: "Trendyol Milla", subCategoryId: 3, productName: "Kadın Skinny Pantolon", imageName: "trendyolmilla1",price: 129.99))
        productList.append(Product.init(id: 11, brandId: 3, brand: "Trendyol Milla", subCategoryId: 2, productName: "Erkek Siyah Bomber Ceket", imageName: "trendyolmilla2",price: 139.99))
        productList.append(Product.init(id: 12, brandId: 3, brand: "Trendyol Milla", subCategoryId: 9, productName: "Kadın Siyah Eşofman", imageName: "trendyolmilla3",price: 149.99))
        // MARK: - Avva
        productList.append(Product.init(id: 13, brandId: 4, brand: "Avva", subCategoryId: 10, productName: "Erkek Siyah Gömlek", imageName: "avva1",price: 54.99))
        productList.append(Product.init(id: 14, brandId: 4, brand: "Avva", subCategoryId: 10, productName: "Erkek Beyaz Gömlek", imageName: "avva2",price: 54.99))
        productList.append(Product.init(id: 15, brandId: 4, brand: "Avva", subCategoryId: 10, productName: "Erkek Mavi Gömlek", imageName: "avva3",price: 54.99))
        // MARK: - Derimod
        productList.append(Product.init(id: 16, brandId: 5, brand: "Derimod", subCategoryId: 7, productName: "Kadın Siyah Çizme", imageName: "derimod1",price: 399.99))
        productList.append(Product.init(id: 17, brandId: 5, brand: "Derimod", subCategoryId: 7, productName: "Kadın Süet Topuklu Bot", imageName: "derimod2",price: 256.40))
        productList.append(Product.init(id: 18, brandId: 5, brand: "Derimod", subCategoryId: 7, productName: "Kadın Siyah Gümüş Detaylı Kovboy Çizme", imageName: "derimod3",price: 225.99))
        // MARK: - Aqua Di Polo
        productList.append(Product.init(id: 19, brandId: 6, brand: "Aqua Di Polo", subCategoryId: 6, productName: "Unisex Siyah Kol Saati", imageName: "aquadipolo1",price: 74.99))
        productList.append(Product.init(id: 20, brandId: 6, brand: "Aqua Di Polo", subCategoryId: 6, productName: "Kadın Pembe Kol Saati", imageName: "aquadipolo2",price: 34.99))
        productList.append(Product.init(id: 21, brandId: 6, brand: "Aqua Di Polo", subCategoryId: 6, productName: "Kadın Hasır Kordon Kol Saati", imageName: "aquadipolo3",price: 75.99))
        // MARK: - Koton
        productList.append(Product.init(id: 22, brandId: 8, brand: "Koton", subCategoryId: 2, productName: "Kadın Gri Ekoseli Ceket ", imageName: "koton1",price: 170.90))
        productList.append(Product.init(id: 23, brandId: 8, brand: "Koton", subCategoryId: 2, productName: "Kadın Siyah Uzun Bomber Ceket", imageName: "koton2",price: 56.90))
        productList.append(Product.init(id: 24, brandId: 8, brand: "Koton", subCategoryId: 2, productName: "Kadın Kırmızı Bomber Ceket", imageName: "koton3",price: 119.90))
        productList = productList.filter{
            $0.brandId == brandId
        }
        
        successHandler(productList)
        
        
    }
}
