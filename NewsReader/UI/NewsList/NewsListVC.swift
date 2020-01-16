//
//  NewsListVC.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit
import RxCocoa

class NewsListVC: MVVMController<NewsListVM> {
    
    // Outlets
    @IBOutlet weak var tvArticles: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "articles".localized
        setupView()
    }
    
    private func setupView() {
        tvArticles.registerCellNib(ofType: NewsListCell.self)
    }
    
    override func bindInput() -> NewsListVM.Input {
        let itemSelected = tvArticles.rx.itemSelected
            .map { $0.row }
            .asDriver(onErrorJustReturn: 0)
        
        return NewsListVM.Input(itemSelect: itemSelected)
    }
    
    override func bindOutput(output: NewsListVM.Output) {
        output.loading
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        output.articles
            .drive(tvArticles.rx
                .items(cellIdentifier: NewsListCell.reuseID, cellType: NewsListCell.self)) { _, model, cell in
                    cell.configure(with: model) }
            .disposed(by: disposeBag)
        
        output.transition
            .drive(transition)
            .disposed(by: disposeBag)
    }
}
