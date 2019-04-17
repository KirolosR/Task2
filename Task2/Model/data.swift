//
//  data.swift
//  Task2
//
//  Created by Kirolos on 4/5/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import Foundation

struct Country : Decodable {
    
    var Id : Int?
    var TitleEN : String?
    var TitleAR : String?
    var  CurrencyId : Int?
    var  CurrencyEN : String?
    var CurrencyAR : String?
    var Code : String?
    
}

struct City : Decodable {
   var Id : Int?
   var TitleEN : String?
    var TitleAR : String?
    var CountryId : Int?
    var CountryEN : String?
    var CountryAR : String?
    
}

struct  Area : Decodable{
    var Id : Int?
    var TitleEN : String?
    var TitleAR : String?
    var FullTitleEN : String?
    var FullTitleAR : String?
    var CityId : Int?
    var CityEN : String?
    var CityAR : String?
    var CountryId : Int?
    var CountryEN : String?
    var CountryAR : String?
}



