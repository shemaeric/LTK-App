//
//  DetailsView.swift
//  ltk-app
//
//  Created by Eric Shema on 14/06/2022.
//

import Foundation
import SwiftUI

struct DetailView : View {
    
    @Binding var show : Bool
    @State var size = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 18) {
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Image("Back").renderingMode(.original)
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("search").renderingMode(.original)
                    
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("bag").renderingMode(.original)
                    
                }
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .padding(15)
            
            Image("img").resizable()
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Summer").font(.largeTitle)
                        Text("$160").fontWeight(.heavy)
                        
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                    
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                        Circle().fill(Color.blue).frame(width: 20, height: 20)
                        Circle().fill(Color.red).frame(width: 20, height: 20)
                        
                    }
                    
                }
                
                Text("Fitted top made from a polyamide blend. Features wide straps and chest reinforcement.")
                
                Text("Select Size")
                
                HStack {
                    
                    ForEach(sizes, id: \.self) { i in
                        
                        Button(action: {
                            
                            self.size = i
                            
                        }) {
                            
                            Text(i).padding().border(Color.black, width: self.size == i ? 1.5 : 0)
                            
                        }.foregroundColor(.black)
                        
                    }
                    
                }
                
                HStack {
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Add To Cart").padding().border(Color.black, width: 1.4)
                        
                    }.foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Buy Now").padding()
                        
                    }.foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                .padding(.top, 15)
                
            }.padding()
            .background(rounded().fill(Color.white))
            .padding(.top, -50)
            
        }
        
    }
    
}