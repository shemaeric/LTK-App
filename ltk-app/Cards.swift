//
//  Cards.swift
//  ltk-app
//
//  Created by Eric Shema on 14/06/2022.
//

import Foundation
import SwiftUI

struct Cards : View {
    
    var row : row
    @State var show = false
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            NavigationLink(
                destination: DetailLTK(show: $show),
                isActive: $show) {
                
                    Image(row.image).resizable().scaledToFit()
                
            }
            
            HStack {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(row.name)
                    Text(row.price).fontWeight(.heavy)
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("option").renderingMode(.original)
                    
                }.padding(.trailing, 15)
                
            }
        }
        
    }
    
}
