//
//  UITableViewExt.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit

extension UITableViewCell: Reusable {}

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID,
                                             for: indexPath) as? T else {
                                                fatalError("Could not dequeue cell: " +  String(describing: T.self))
        }
        return cell
    }
    
    func registerCellNib<T: UITableViewCell>(ofType cellType: T.Type = T.self) {
        self.register(UINib(nibName: cellType.reuseID, bundle: nil),
                      forCellReuseIdentifier: cellType.reuseID)
    }
}
