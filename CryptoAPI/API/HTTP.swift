//
//  HTTP.swift
//  CryptoAPI
//
//  Created by Ahmet Ali ÇETİN on 18.04.2023.
//

import Foundation

enum HTTP {
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        enum API_KEY: String {
            case contentType = "content_type"
            case apiKey = "X-CMC_PRO_API_KEY"
        }
        
        enum Value: String {
            case applicationJSON = "application/json"
        }
    }
}
