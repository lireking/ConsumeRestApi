//
//  SalewaDay.swift
//  ConsumeRestApi
//
//  Created by OakHost Customer on 10/03/2022.
//

import Foundation

struct SalewaDay: Codable, Identifiable {
    let id = UUID()
    var brandname: String
    var totalamount: Double
    var currency: String
    var totalorders: Int    
}

class ApiSalewaDay : ObservableObject{
    @Published var brands = [SalewaDay]()
    
    func loadData(completion:@escaping ([SalewaDay]) -> ()) {
        
        guard let url = URL(string: "https://1h1omds22f.execute-api.eu-central-1.amazonaws.com/default/SkySql_Datafetch?method=currentday_salewa") else {
            print("Invalid url ...")
            return
        }
        
            var request = URLRequest(url: url)
            request.addValue("IbD33WglCJ5pBPJxhDkUf6xEFXLH5XT04IrGOsmu", forHTTPHeaderField: "x-api-key")
            request.httpMethod = "GET"
            request.setValue("brand", forHTTPHeaderField: "salewa")
        //request.addValue("Token \(tokenString)", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                let salewadays = try! JSONDecoder().decode([SalewaDay].self, from: data!)
                    //print(books)
                    DispatchQueue.main.async {
                        completion(salewadays)
                    }
            }.resume()
        }
    }
