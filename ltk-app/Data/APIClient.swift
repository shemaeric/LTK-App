//
//  APIClient.swift
//  ltk-app
//
//  Created by Eric Shema on 15/06/2022.
//

import Foundation
import UIKit

extension API {
    
    // MARK: - Defining the Clien
    
    
    /* This will be the client that will be handling the fetch of data and
     Error handling
    */
    
    class Client {
        
        static let shared = Client()
        private let encoder = JSONEncoder()
        private let decoder = JSONDecoder()
        
        
        func fetchLtks<Request, Response>(_ endpoint: API.Endpoint, method: API.Method, body: Request? = nil, then callback:((Result<Response, API.Error>) -> Void)? = nil) where Request: Encodable, Response: Decodable {
            
            var urlRequest = URLRequest(url: endpoint.url)
            
            urlRequest.httpMethod = method.rawValue
            
            if let body = body {
                do {
                    urlRequest.httpBody = try encoder.encode(body)
                } catch {
                    
                    callback?(.failure(.internal(reason: "Body Encoding Failed")))
                    return
                }
            }
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { [self]
                data, response, error in
                
                if let error = error {
                    callback?(.failure(.generic(reason: "Could not fetch Data: \(error.localizedDescription)")))
                } else {
                    
                    if let data = data {
                        do {
                            
                            let result = try decoder.decode(Response.self, from: data)
                            callback?(.success(result))
                            
                        } catch {
                            print("decoding error", error)
                            callback?(.failure(.generic(reason: "Could not decode data: \(error.localizedDescription)")))
                        }
                    }
                }
            })
            
            dataTask.resume()
            
        }
        
        func get<Response>(_ endpoint: API.Endpoint, then callback:((Result<Response, API.Error>) -> Void)? = nil ) where Response: Decodable {
            
            let body: API.Request.Empty? = nil
            
            fetchLtks(endpoint, method: .get, body: body) {
                result in
                callback?(result)
            }
        }
    }
}
