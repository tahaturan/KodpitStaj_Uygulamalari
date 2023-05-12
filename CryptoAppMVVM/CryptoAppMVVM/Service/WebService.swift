//
//  WebService.swift
//  CryptoAppMVVM
//
//  Created by Taha Turan on 12.05.2023.
//

import Foundation

class WebService{
    
    func downloadCurrency(url:URL , completion:@escaping([CryptoModel]?) -> ())  {
        
        URLSession.shared.dataTask(with: url) { data , response , error in
            if let error = error{
                
                print(error.localizedDescription)
                completion(nil)
                
            }else if let data = data{
                
                let cryptoList = try? JSONDecoder().decode([CryptoModel].self, from: data)
                
                
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }

            }
            
            
        }.resume()
        
        
    }
    
    
}
