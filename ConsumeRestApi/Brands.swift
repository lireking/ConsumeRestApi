//
//  Brands.swift
//  ConsumeRestApi
//
//  Created by OakHost Customer on 07/03/2022.
//

import Foundation

struct Brands: Codable, Identifiable {
    let id = UUID()
    var idbrands: Int
    var brandname: String
    var brandline: String
}

class Api : ObservableObject{
    @Published var brands = [Brands]()
    
    func loadData(completion:@escaping ([Brands]) -> ()) {
        
        guard let url = URL(string: "https://1h1omds22f.execute-api.eu-central-1.amazonaws.com/default/SkySql_Datafetch?method=brands") else {
            print("Invalid url ...")
            return
        }
        
            var request = URLRequest(url: url)
            request.addValue("IbD33WglCJ5pBPJxhDkUf6xEFXLH5XT04IrGOsmu", forHTTPHeaderField: "x-api-key")
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                let brands = try! JSONDecoder().decode([Brands].self, from: data!)
                    //print(books)
                    DispatchQueue.main.async {
                        completion(brands)
                    }
            }.resume()
        }
    }
