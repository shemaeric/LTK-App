//
//  APITypes.swift
//  ltk-app
//
//  Created by Eric Shema on 15/06/2022.
//

import Foundation

extension API {
    
    enum Response {
        
        struct DataResponse: Decodable {
            
            var ltks: [LTKs]
            
            struct LTKs: Decodable {
                
                var hero_image: String
                var id: String
                var profile_id: String
                var profile_user_id: String
                var caption: String
                
            }
        }
    }
    
    enum Request {
        
        struct Empty: Encodable {
            
        }
    }
    
}
