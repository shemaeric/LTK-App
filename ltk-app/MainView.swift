//
//  MainView.swift
//  ltk-app
//
//  Created by Eric Shema on 14/06/2022.
//

import Foundation
import SwiftUI

struct MainView : View {
    
    @State var selected = "Dress"
    
    var data: API.Response.DataResponse
    
    var body: some View {
        
        VStack(spacing: 15) {
            HStack {
                
                ForEach(types, id: \.self) { i in
                    
                    HStack {
                        
                        Button(action: {
                            
                            self.selected = i
                            
                        }) {
                            
                            Text(i).padding()
                            
                        }
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                        
                        Spacer(minLength: 0)
                        
                    }
                    
                }
                
            }
            
            DetailsScroll(data: data)
            
        }.padding()
        .background(Color("Color"))
        .animation(.spring())
        
    }
    
}
