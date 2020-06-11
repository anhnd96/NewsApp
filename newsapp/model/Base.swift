//
//  DocumentStructure.swift
//  newsapp
//
//  Created by Duc Anh on 5/16/20.
//  Copyright © 2020 Duc Anh. All rights reserved.
//

import Foundation
import ObjectMapper

class Base: Mappable {
    var status : String?
    var copyright : String?
    var response : Response?
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        status <- map["status"]
        copyright <- map["copyright"]
        response <- map["response"]
    }
}

class Response: Mappable {
    var docs = [Docs]()
    var meta : Meta?
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        docs <- map["docs"]
        meta <- map["meta"]
    }
}
