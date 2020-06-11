//
//  DocsDetail.swift
//  newsapp
//
//  Created by Duc Anh on 5/18/20.
//  Copyright © 2020 Duc Anh. All rights reserved.
//

import Foundation
import ObjectMapper

class Multimedia: Mappable {

    var rank: Int?
    var subtype: String?
    var caption: String?
    var credit: String?
    var type: String?
    var url: String?
    var height: Int?
    var width: Int?
    var legacy = Legacy()
    var crop_name: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        rank <- map["rank"]
        subtype <- map["subtype"]
        caption <- map["caption"]
        credit <- map["credit"]
        type <- map["type"]
        url <- map["url"]
        height <- map["height"]
        width <- map["width"]
        legacy <- map["legacy"]
        crop_name <- map["crop_name"]
        
    }
    
}

class Headline: Mappable {
    var main: String?
    var kicker: String?
    var content_kicker: String?
    var print_headline: String?
    var name: String?
    var seo: String?
    var sub: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        main <- map["main"]
        kicker <- map["kicker"]
        content_kicker <- map["content_kicker"]
        print_headline <- map["print_headline"]
        name <- map["name"]
        seo <- map["seo"]
        sub <- map["sub"]
    }
}

class Keywords: Mappable {
    var name : String?
    var value : String?
    var rank : Int?
    var major : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        name <- map["name"]
        value <- map["value"]
        rank <- map["rank"]
        major <- map["major"]
    }
    
}

class Byline: Mappable {
    var original: String?
    var person: [Person]?
    var organization: String?
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        original <- map["original"]
        person <- map["person"]
        organization <- map["organization"]
    }
    
}

class Legacy: Mappable {

    var thumbnail: String?
    var thumbnailwidth: Int?
    var thumbnailheight: Int?
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        thumbnail <- map["thumbnail"]
        thumbnailwidth <- map["thumbnailwidth"]
        thumbnailheight <- map["thumbnailheight"]
    }
}
