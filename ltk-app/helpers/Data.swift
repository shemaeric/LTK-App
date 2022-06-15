//
//  Row.swift
//  ltk-app
//
//  Created by Eric Shema on 14/06/2022.
//

import Foundation

struct type : Identifiable {
    
    var id : Int
    var rows : [row]
    
}

struct row : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
    
}
