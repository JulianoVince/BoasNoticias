//
//  NewsListTableViewController.swift
//  BoasNoticias
//
//  Created by Juliano Campos on 16/07/19.
//  Copyright © 2019 Juliano Campos. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    
        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-06-16&sortBy=publishedAt&apiKey=ecfe08c62ff540a3a615c160a0e4a378"
            )!
        WebService().getArticles(url: url){ _ in
            
        }
    }
}
