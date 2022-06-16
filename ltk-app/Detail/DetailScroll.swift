//
//  DetailScroll.swift
//  ltk-app
//
//  Created by Eric Shema on 14/06/2022.
//

import Foundation
import SwiftUI

struct DetailsScroll : View {
    
    @State var show = false
    
    var data: API.Response.DataResponse
    
    var body : some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 12) {
                
                ForEach(data.ltks) { i in
                    Cards(row: i, data: data)
                }
            }
        }
    }
}
