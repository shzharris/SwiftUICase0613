//
//  Date+Extension.swift
//  InternetSync
//
//  Created by HarrisShao on 2025/6/13.
//

import SwiftUI

extension DateFormatter {
    static let yearMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY年 MM月"
        return formatter
    }()
    
    
}

extension Date {
    var day:String {
        let calendar  = Calendar.current
        return "\(calendar.component(.day, from: self))"
    }
    
    func isSameDay(as date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }
}
