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
    @State private var showSafari: Bool = false
    
    var data: API.Response.DataResponse
    var product: API.Response.DataResponse.Product
    var ltk: API.Response.DataResponse.LTK
    
    @State var profileName = ""
    @State var profilePic = ""
    @State var profileFullName = ""
    
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
                    
                    if profileFullName.isEmpty {
                        
                        Text(profileName)
                        
                    } else {
                        Text(profileFullName)
                    }
                    
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("bag").renderingMode(.original)
                    
                }
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .padding(15)
            
            AsyncImage(url: URL(string: product.image_url)) {
                
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
            }
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text(product.matching).font(.largeTitle)
                        
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                    
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                        Circle().fill(Color.blue).frame(width: 20, height: 20)
                        Circle().fill(Color.red).frame(width: 20, height: 20)
                        
                    }
                    
                }
                
                Text(ltk.caption)
                
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
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Buy Now").padding().onTapGesture {
                            showSafari.toggle()
                        }.fullScreenCover(isPresented: $showSafari, content: {
                            SFSafariViewWrapper(url: URL(string: product.hyperlink)!)
                    })
                    }.foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                .padding(.top, 15)
                
            }.padding()
            .background(rounded().fill(Color.white))
            .padding(.top, -50)
            
        }.onAppear(perform: {
            
            for profile in data.profiles {
                
                if profile.id == ltk.profile_id {
                    
                    profileName = profile.display_name
                    profilePic = profile.avatar_url
                    profileFullName = profile.full_name
                }
            }
        })
        
    }
    
}
