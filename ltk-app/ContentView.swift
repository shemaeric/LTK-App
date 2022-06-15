//
//  ContentView.swift
//  ltk-app
//
//  Created by Eric Shema on 14/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 15) {
                
                ZStack {
                    
                    Text("Kigali Software").font(.title)
                    
                    HStack(spacing: 18) {
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("Menu").renderingMode(.original)
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("search").renderingMode(.original)
                            
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("bell").renderingMode(.original)
                            
                        }
                        
                    }
                    
                }.background(Color.white)
                .padding([.leading, .trailing, .top], 15)
                
               MainView()
                    
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Sample data has already been created

var sizes = ["S","M","X","XL"]

var types = ["Dress","Pants","Blazers","Skirt"]

var datas = [
    

    type(id: 0,rows: [row(id:0,name: "Fit And Flare", price: "$299", image: "img1"),row(id:1,name: "Flexi Dress", price: "$160", image: "img2")]),

    type(id: 2,rows: [row(id:0,name: "Summer Vibes", price: "$160", image: "img3"),row(id:1,name: "Flora Fun", price: "$200", image: "img4")]),

]
