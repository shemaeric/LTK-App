//
//  ContentView.swift
//  ltk-app
//
//  Created by Eric Shema on 14/06/2022.
//

import SwiftUI

var isFetched: Bool = false

struct ContentView: View {
    
    @State var dataValues: API.Response.DataResponse? = nil
    
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
                
                if dataValues != nil {
                    MainView(data: dataValues!)
                }
                    
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }.task {
            
            fetchResult(featured: "true", limit: "20")
            
        }
        
    }
    
    // MARK: - Fetch Result from API
    
    
    /* Fetch the Result from API
    */
    
    func fetchResult(featured: String, limit: String) {
        
        API.Client.shared.get(.ltks(featured: featured, limit: limit)) {
            
            (result: Result<API.Response.DataResponse, API.Error>) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    parseResult(success)
                case .failure(let failure):
                    print("the failure now", failure.localizedDescription)
                }
            }
            
        }
    }

    // MARK: - Passing Results
    
    
    /* Passing results to be reflected on the UI
    */
    
    private func parseResult(_ result: API.Response.DataResponse) {
        
        let fetchedValues = API.Response.DataResponse(ltks: result.ltks, profiles: result.profiles, products: result.products)
        
        dataValues = fetchedValues
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

var sizes = ["S","M","X","XL"]

var types = ["All"]



