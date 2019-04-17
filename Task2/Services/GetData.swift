//
//  GetData.swift
//  Task2
//
//  Created by Kirolos on 4/5/19.
//  Copyright © 2019 Kirolos. All rights reserved.
//

import Foundation
import Alamofire

class getData {
    
    static let instance = getData()
    static var countries : [Country]?
    static var cities : [City]?
    static var areas : [Area]?
    
    func getCountries (Url : String ,completion :@escaping competionHandler){
        Alamofire.request(Url, method: .get ).responseJSON {
            (response) in
            if response.result.error == nil {
                guard let data = response.data  else { return }
                // let json = try? JSONSerialization.data(withJSONObject: data)
                
                guard let ar = try? JSONDecoder().decode([Country].self , from : data)  else {
                    debugPrint(" Can't parse json")
                    return }
                
                debugPrint(ar)
                getData.countries = ar
                
                
                debugPrint(response.result.value as Any)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    func getCities (Url : String ,completion :@escaping competionHandler){
        Alamofire.request(Url, method: .get ).responseJSON {
            (response) in
            if response.result.error == nil {
                guard let data = response.data  else { return }
                // let json = try? JSONSerialization.data(withJSONObject: data)
                
                guard let ar = try? JSONDecoder().decode([City].self , from : data)  else {
                    debugPrint(" Can't parse json")
                    return }
                
                debugPrint(ar)
                getData.cities = ar
                
                
                debugPrint(response.result.value as Any)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    func getAreas(Url : String ,completion :@escaping competionHandler){
        Alamofire.request(Url, method: .get ).responseJSON {
            (response) in
            if response.result.error == nil {
                guard let data = response.data  else { return }
                // let json = try? JSONSerialization.data(withJSONObject: data)
                
                guard let ar = try? JSONDecoder().decode([Area].self , from : data)  else {
                    debugPrint(" Can't parse json")
                    return }
                
                debugPrint(ar)
                getData.areas = ar
                
                
                debugPrint(response.result.value as Any)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
    
    
}
