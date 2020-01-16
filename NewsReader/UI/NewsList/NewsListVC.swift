//
//  NewsListVC.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit

class NewsListVC: MVVMController<NewsListVM> {

    override func bindInput() -> NewsListVM.Input {
        return NewsListVM.Input()
    }
    
    override func bindOutput(output: NewsListVM.Output) {
        // TODO: add implementation
    }
}
