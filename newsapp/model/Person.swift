//
//  Person.swift
//  newsapp
//
//  Created by Duc Anh on 5/18/20.
//  Copyright © 2020 Duc Anh. All rights reserved.
//

import Foundation
import ObjectMapper

class Person: Mappable {
    var firstname : String?
    var middlename : String?
    var lastname : String?
    var qualifier : String?
    var title : String?
    var role : String?
    var organization : String?
    var rank : Int?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        firstname <- map["firstname"]
        middlename <- map["middlename"]
        lastname <- map["lastname"]
        qualifier <- map["qualifier"]
        title <- map["title"]
        role <- map["role"]
        organization <- map["organization"]
        rank <- map["rank"]
    }
    
    
}
