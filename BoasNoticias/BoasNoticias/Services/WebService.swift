//
//  WebService.swift
//  BoasNoticias
//
//  Created by Juliano Campos on 16/07/19.
//  Copyright © 2019 Juliano Campos. All rights reserved.
//

import Foundation

class WebService{
    
    func getArticles(url:URL, completion: @escaping ([Any]?)-> ()){
        URLSession.shared.dataTask(with: url) { data,response,error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(data)
            }
        }.resume()
    }
}
