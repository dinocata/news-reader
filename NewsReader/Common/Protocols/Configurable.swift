//
//  Configurable.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

protocol Configurable {
    associatedtype Data
    
    func configure(with data: Data)
}
