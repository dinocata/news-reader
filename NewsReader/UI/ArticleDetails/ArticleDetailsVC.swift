//
//  ArticleDetailsVC.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit

class ArticleDetailsVC: MVVMController<ArticleDetailsVM> {
    
    // Outlets
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnSource: UIButton!
    
    // Parameter
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "articles".localized
    }
    
    override func bindInput() -> ArticleDetailsVM.Input {
        return ArticleDetailsVM.Input(article: .just(article),
                                      source: btnSource.rx.tap.asDriver())
    }
    
    override func bindOutput(output: ArticleDetailsVM.Output) {
        output.data
            .drive(onNext: { [weak self] data in
                guard let self = self else {
                    return
                }
                
                self.ivImage.sd_setImage(with: URL(string: data.imagePath))
                self.lblTitle.text = data.title
                self.lblAuthor.text = String(format: "author_name".localized, data.author)
                self.lblDescription.text = data.description
            })
            .disposed(by: disposeBag)
        
        output.link
            .drive(onNext: { UIApplication.shared.open($0) })
            .disposed(by: disposeBag)
    }
}
