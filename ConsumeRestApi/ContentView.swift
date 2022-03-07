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
                
                HStack{
                    Text("\(brand.brandline)")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                .padding(0.0)
                Spacer()
            }
            .padding(.all, 0.0)
        }
        .onAppear() {
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
