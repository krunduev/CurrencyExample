//
//  CreateCurrency.swift
//  TestIForlya
//
//  Created by Kostyantyn Runduyev on 3/21/18.
//  Copyright © 2018 Kostyantyn Runduyev. All rights reserved.
//

import Foundation
import ObjectMapper


//{
//    "success": true,
//    "terms": "https://currencylayer.com/terms",
//    "privacy": "https://currencylayer.com/privacy",
//    "timestamp": 1521634477,
//    "source": "USD",
//    "quotes": {
//        "USDEUR": 0.814395,
//        "USDGBP": 0.71176,
//        "USDCAD": 1.29903,
//        "USDPLN": 3.450406
//    }
//}

class CurrencyResponse: Mappable {
    var success: Bool?
    var terms: String?
    var privacy: String?
    var timestamp: UInt?
    var source: String?

    var quotes: Quotes?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        terms <- map["terms"]
        privacy <- map["privacy"]
        timestamp <- map["timestamp"]
        source <- map["source"]
        
        quotes <- map["quotes"]
    }
}

class Quotes: Mappable {
    var USDEUR: Float?
    var USDGBP: Float?
    var USDCAD: Float?
    var USDPLN: Float?

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        USDEUR <- map["USDEUR"]
        USDGBP <- map["USDGBP"]
        USDCAD <- map["USDCAD"]
        USDPLN <- map["USDPLN"]
    }
}
