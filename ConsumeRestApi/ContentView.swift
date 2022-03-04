//
//  ContentView.swift
//  ConsumeRestApi
//
//  Created by OakHost Customer on 03/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var books = [Book]()
    
    var body: some View {
        List(books) { book in
            
            VStack(alignment: .leading) {
                
                Text("\(book.title)")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding(.bottom)
                
                HStack{
                    Text("\(book.author)")
                        .font(.body)
                        .fontWeight(.bold)
                    Text("\(book.email)")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
        }
        .onAppear() {
            Api().loadData { (books) in
                   self.books = books
                }
            }.navigationTitle("Book List")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
