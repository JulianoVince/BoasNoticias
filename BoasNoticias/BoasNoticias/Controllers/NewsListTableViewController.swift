//
//  NewsListTableViewController.swift
//  BoasNoticias
//
//  Created by Juliano Campos on 16/07/19.
//  Copyright © 2019 Juliano Campos. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    static func getFormatterDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        
        let date = Date()
        let result = formatter.string(from:date)
        return result
    }
}

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=\(Date.getFormatterDate())&sortBy=publishedAt&apiKey=ecfe08c62ff540a3a615c160a0e4a378"
            )!
        
        WebService().getArticles(url: url){ articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
}
