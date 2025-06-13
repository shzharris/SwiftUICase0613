//
//  HistoryTodayViewModel.swift
//  InternetSync
//
//  Created by HarrisShao on 2025/6/13.
//

import SwiftUI

class HistoryTodayViewModel: ObservableObject {
    @Published var historyDaily: [HistoryTodayModel] = []
    @Published var calendarDate: Date = Date()
    @Published var selectedDate: Date = Date()

    let dataApiUrl: String = "https://api.npoint.io/a8460ae65be9e41c8484"
    
    // 获取 API 数据
    func fetchHistoryTodayData() {
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: URL(string: dataApiUrl)!) {
            data,
            response,
            error in

            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                if statusCode == 200, let httpData = data {
                    
                    do {
                        let jsonDecoder = JSONDecoder()
                        let getData = try jsonDecoder.decode([HistoryTodayModel].self, from: httpData)
                        
                        DispatchQueue.main.async{
                            self.historyDaily = getData
                        }
                        
                    } catch {
                        print("Error decoding Json:\(error)")
                    }
                    
                } else {
                    print("HTTP 状态码错误")
                }
            } else if let httpError = error {
                print("网络请求错误，错误信息：\(httpError.localizedDescription)")
            } else {
                print("未知错误")
            }
        }
        
        task.resume()
    }
    
    // 获取当前月的天数
    func daysOfMonth() -> [Date] {
        let calender = Calendar.current
        let range = calender.range(of: .day, in: .month, for: calendarDate)!
        let startOfMonth = calender.date(from: calender.dateComponents([.year, .month], from: calendarDate))!
        
        return (1 ..< range.count + 1).map {
            calender.date(byAdding: .day, value: $0 - 1, to: startOfMonth)!
        }
    }
    
    // 获取当月的开始日期
    func firstDayOfWeekForMonth() -> Int {
        let calendar = Calendar.current
        let firstDay = daysOfMonth().first ?? Date()
        return calendar.component(.weekday, from: firstDay - 1)
    }
    
}
