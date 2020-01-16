//
//  DateExt.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import Foundation

extension Date {
    /// Formats Date object into human readable date format
    ///
    /// - Parameter dateFormat: Format to display the date in
    /// - Returns: Formatted date string
    func toDateString(dateFormat: String = Constants.DateFormat.defaultDateTime) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
}
