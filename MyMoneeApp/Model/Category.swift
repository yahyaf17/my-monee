//
//  Category.swift
//  MyMoneeApp
//
//  Created by MacBook on 14/05/21.
//

import Foundation

enum CategoryList: String {
    case income = "Pemasukan"
    case outcome = "Pengeluaran"
}

struct Category {
    
    var title: CategoryList
    var image: String
    
    init(title: CategoryList, image: String) {
        self.title = title
        self.image = image
    }
    
}
