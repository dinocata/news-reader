//
//  ViewModelType.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Foundation

/// https://medium.com/blablacar-tech/rxswift-mvvm-66827b8b3f10
protocol ViewModelType: class {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
