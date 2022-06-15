//
//  DetailLTK.swift
//  ltk-app
//
//  Created by Eric Shema on 14/06/2022.
//

import Foundation
import SwiftUI

struct DetailLTK: View {
     
    @Binding var show : Bool
    
    var body: some View {
        ZStack {
            
            Image("img").resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity)
            
            VStack {
                
                ScrollView(.horizontal) {
                    
                    Spacer()
                    
                    HStack() {
                        
                        NavigationLink(destination: DetailView(show: $show)) {
                            ZStack(alignment: .bottom) {
                                Image("img2").aspectRatio(contentMode: .fill)
                                    .edgesIgnoringSafeArea(.all)
                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150)
                                
                                Spacer()
                                
                                Button("Exact") {
                                    print("Button pressed!")
                                }
                                .padding(.horizontal, 24)
                                .padding(.vertical, 10)
                                .background(.green)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                            }.cornerRadius(10)
                        }
                        
                        ZStack(alignment: .bottom) {
                            Image("img2").aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150)
                            
                            Spacer()
                            
                            Button("Exact") {
                                print("Button pressed!")
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(.green)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                        }.cornerRadius(10)
                        
                        ZStack(alignment: .bottom) {
                            Image("img2").aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150)
                            
                            Spacer()
                            
                            Button("Exact") {
                                print("Button pressed!")
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(.green)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                        }.cornerRadius(10)
                    }
                    
                    }
                    .padding(.horizontal, 24)
                    .zIndex(1)
                
            }
        }
    }
}
