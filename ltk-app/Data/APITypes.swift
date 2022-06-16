//
//  APITypes.swift
//  ltk-app
//
//  Created by Eric Shema on 15/06/2022.
//

import Foundation
import SwiftUI

extension API {
    
    // MARK: - Defining the Response
    
    /* The Response includes necessary parameters that will be captured from the response
     that will be sent by the API endpoint
    */
    
    enum Response {
        
        struct DataResponse: Decodable {
            
            var ltks: [LTK]
            var profiles: [Profile]
            var products: [Product]
            
            struct LTK: Decodable, Identifiable {
                
                var hero_image: String
                var id: String
                var profile_id: String
                var caption: String
                var product_ids: [String]
                
            }
            
            struct Profile: Decodable, Identifiable {
                var id: String
                var avatar_url: String
                var display_name: String
                var full_name: String
                
            }
            
            struct Product: Decodable, Identifiable {
                
                var id: String
                var ltk_id: String
                var hyperlink: String
                var image_url: String
                var matching: String
            }
        }
    }
    
    // MARK: - Defining the Empty Request
    
    
    /* The Request Method is GET and
    we will be sending the empty body
    */
    
    enum Request {
        
        struct Empty: Encodable {
            
        }
    }
    
    // MARK: - Defining the Error
    
    enum Error: LocalizedError {
        
        case generic(reason: String)
        case `internal`(reason: String)
        
        var errorDescription: String? {
            
            switch self {
            case .generic(let reason):
                return reason
            
            case .internal(let reason):
                return "We experienced an Internal Error: \(reason)"
            }
        }
    }
    
    // MARK: - Defining the Endpoint
    
    enum Endpoint {
        
        case ltks(featured: String, limit: String)
        
        var url: URL {
            
            var urlComponents = URLComponents()
            urlComponents.host = "api-gateway.rewardstyle.com"
            urlComponents.scheme = "https"
            
            switch self {
            case .ltks(let featured, let limit):
                
                urlComponents.path = "/api/ltk/v2/ltks/"
                
                urlComponents.queryItems = [
                    URLQueryItem(name: "featured", value: featured),
                    URLQueryItem(name: "limit", value: limit)
                ]
                
                return urlComponents.url!
            }
            
        }
    }
    
    enum Method: String {
        
        case get
        
    }
    
}
