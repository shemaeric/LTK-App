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
                        .foregroundColor(self.selected == i ? .white : .black)
                        .background(self.selected == i ? Color.black : Color.clear)
                        .cornerRadius(10)
                        
                        Spacer(minLength: 0)
                        
                    }
                    
                }
                
            }
            
            DetailsScroll()
            
        }.padding()
        .background(Color("Color"))
        .animation(.spring())
        
    }
    
}
