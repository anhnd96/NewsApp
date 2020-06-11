//
//  DocumentDetail.swift
//  newsapp
//
//  Created by Duc Anh on 5/18/20.
//  Copyright © 2020 Duc Anh. All rights reserved.
//

import Foundation
import ObjectMapper

class Docs: Mappable {
    var abstract : String?
    var web_url : String?
    var snippet : String?
    var lead_paragraph : String?
    var print_section : String?
    var print_page : String?
    var source : String?
    var multimedia = [Multimedia]()
    var headline : Headline?
    var keywords = [Keywords]()
    var pub_date : String?
    var document_type : String?
    var news_desk : String?
    var section_name : String?
    var subsection_name: String?
    var byline : Byline?
    var type_of_material : String?
    var _id : String?
    var word_count : Int?
    var uri : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        abstract <- map["abstract"]
        web_url <- map["web_url"]
        snippet <- map["snippet"]
        lead_paragraph <- map["lead_paragraph"]
        print_section <- map["print_section"]
        print_page <- map["print_page"]
        source <- map["source"]
        multimedia <- map["multimedia"]
        headline <- map["headline"]
        keywords <- map["keywords"]
        pub_date <- map["pub_date"]
        document_type <- map["document_type"]
        news_desk <- map["news_deck"]
        section_name <- map["section_name"]
        subsection_name <- map["subsection_name"]
        byline <- map["byline"]
        type_of_material <- map["type_of_material"]
        _id <- map["_id"]
        word_count <- map["word_count"]
        uri <- map["uri"]
        
    }
}

class Meta: Mappable{
    var hits : Int?
    var offset : Int?
    var time : CLong?
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        hits <- map["hits"]
        offset <- map["offset"]
        time <- map["time"]
    }
}
