//
//  Restaurant.swift
//  FoodPin
//
//  Created by apple on 15/7/4.
//  Copyright (c) 2015年 yunlong. All rights reserved.
//

class Restaurant {
    
    var name: String = ""
    var type: String = ""
    var location: String?
    var image: String = ""
    var isVisited: Bool = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
    
}
