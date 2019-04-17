//
//  Contrains.swift
//  Task2
//
//  Created by Kirolos on 4/5/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import Foundation


let COUNTRIES_URL = "http://www.salonidepot.com/app/app.asmx/GetCountries"
let CITIES_URL = "http://www.salonidepot.com/app/app.asmx/GetCities?countryId="
let AREAS_URL = "http://www.salonidepot.com/app/app.asmx/GetAreas?cityId="
let TERMS_URL = "https://termsfeed.com/blog/sample-terms-and-conditions-template/"

typealias competionHandler = (_ Success : Bool) -> ()
