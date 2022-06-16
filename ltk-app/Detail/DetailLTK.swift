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
    
    var ltk: API.Response.DataResponse.LTK
    var allData: API.Response.DataResponse
    
    var body: some View {
        
        ZStack {
            
            AsyncImage(url: URL(string: ltk.hero_image)) {
                
                phase in
                switch phase {
                    
                case .empty:
                    ProgressView()
                    
                case .success(let image):
                    image.resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all).frame(minWidth: 0, maxWidth: .infinity)
                case .failure(_):
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack {
                
                ScrollView(.horizontal) {
                    
                    Spacer()
                    
                    HStack() {
                        
                        ForEach(allData.products) { productValue in
                            
                            if productValue.ltk_id == ltk.id {
                                
                                NavigationLink(destination: DetailView(show: $show, data: allData, product: productValue, ltk: ltk)) {
                                    ZStack(alignment: .bottom) {
                                
                                        AsyncImage(url: URL(string: productValue.image_url)) {
                                
                                            phase in
                                            switch phase {
                                
                                            case .empty:
                                                ProgressView()
                                
                                            case .success(let image):
                                                image.resizable().aspectRatio(contentMode: .fill)
                                                    .edgesIgnoringSafeArea(.all)
                                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150)
                                            case .failure(_):
                                                Image(systemName: "photo")
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                
                                        Spacer()
                                
                                        Button("Similar prodcut") {
                                            print("Button pressed!")
                                        }
                                        .padding(.horizontal, 4)
                                        .padding(.vertical, 4)
                                        .background(.green)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                    }.cornerRadius(10)
                                }
                                
                            }
                            
                        }
                    }
                    
                    }
                    .padding(.horizontal, 24)
                    .zIndex(1)
                
            }
        }
    }
}
