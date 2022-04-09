//
//  ContentView.swift
//  ConsumeRestApi
//
//  Created by OakHost Customer on 03/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var brands = [Brands]()
    
    var body: some View {
        List(brands) { brand in
            
            VStack(alignment: .leading) {
                
                Text("\(brand.brandname)")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.bottom)
                    //.padding(.top)
                
                HStack{
                    Text("\(brand.brandline)")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                .padding(0.0)
                //Divider()
                //Spacer()
            }
            .padding(.all, 0.0)
            //.background(Color.white)
        }
        .background(Color.white)
        .onAppear() {
            Api().loadData { (brands) in
                   self.brands = brands
                }
            }.navigationTitle("Brand List")
        .refreshable() {
            Api().loadData { (brands) in
                   self.brands = brands
                }
        }.navigationTitle("Brand List")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
