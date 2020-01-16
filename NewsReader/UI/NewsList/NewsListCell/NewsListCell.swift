//
//  NewsListCell.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit
import SDWebImage

class NewsListCell: UITableViewCell {
    
    struct Data {
        let thumbnailPath: String
        let title: String
        let date: String
        
        init(article: Article) {
            self.thumbnailPath = article.urlToImage
            self.title = article.title
            self.date = article.publishedAt.asDate()?.toDateString() ?? "-"
        }
    }
    
    // Outlets
    @IBOutlet weak var ivThumbnail: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
}

extension NewsListCell: Configurable {
    func configure(with data: Data) {
        self.ivThumbnail.sd_setImage(with: URL(string: data.thumbnailPath))
        self.lblTitle.text = data.title
        self.lblDate.text = data.date
    }
}
