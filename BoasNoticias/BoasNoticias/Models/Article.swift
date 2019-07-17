//
//  Article.swift
//  BoasNoticias
//
//  Created by Juliano Campos on 17/07/19.
//  Copyright © 2019 Juliano Campos. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable{
    
    let title:String
    let description:String
    
}
