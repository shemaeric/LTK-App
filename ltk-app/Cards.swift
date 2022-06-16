//
//  Cards.swift
//  ltk-app
//
//  Created by Eric Shema on 14/06/2022.
//

import Foundation
import SwiftUI

struct Cards : View {
    
    var row : API.Response.DataResponse.LTK
    
    @State var show = false
    
    var data: API.Response.DataResponse
    
    var dataValues = API.Response.DataResponse.self
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            NavigationLink(
                destination: DetailLTK(show: $show, ltk: row, allData: data),
                isActive: $show) {
                
                    AsyncImage(url: URL(string: row.hero_image)) {
                        
                        phase in
                        switch phase {
                            
                        case .empty:
                            ProgressView()
                            
                        case .success(let image):
                            image.resizable().scaledToFit()
                        case .failure(_):
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }.cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                        )
            
                
            }
            
        }
        
    }
    
}
