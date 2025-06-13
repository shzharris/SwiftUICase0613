//
//  CalenderView.swift
//  InternetSync
//
//  Created by HarrisShao on 2025/6/13.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var historyTodayVM = HistoryTodayViewModel()
    let daysInWeek: [String] = [
        "日", "一", "二", "三", "四", "五", "六"
    ]
    let gridItemLayout = Array(repeating: GridItem(), count: 7)
    
    
    var body: some View {
        
        
        NavigationStack {
            
            VStack {
                yearMonthView
                    
                LazyVGrid(columns: gridItemLayout) {
                    weekView
                    firstDayOfWeekForMonthView
                    dayView
                }
            }
            .navigationTitle("Calendar")
            .navigationBarTitleDisplayMode(.inline)
        
            
        }
    }
    
    private var yearMonthView: some View {
        Text("\(historyTodayVM.calendarDate, formatter: DateFormatter.yearMonth)")
            .font(.largeTitle)
            .padding(.top, 16)
    }
    
    private var weekView: some View {
        ForEach(daysInWeek, id:\.self) { day in
            Text(day)
                .font(.headline)
                .frame(maxWidth: .infinity)
        }
    }
    private var dayView: some View {
        ForEach(historyTodayVM.daysOfMonth(), id: \.self) {day in
            Text("\(day.day)")
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, minHeight: 48)
                .cornerRadius(20)
                .foregroundColor(day.isSameDay(as: historyTodayVM.selectedDate) ? Color.white : Color.black)
                .background(day.isSameDay(as: historyTodayVM.selectedDate) ? Color.blue : Color.clear)
                .onTapGesture {
                    historyTodayVM.selectedDate = day
                }
        }
    }
    // 日历起始日期
    private var firstDayOfWeekForMonthView: some View {
        ForEach(0 ..< historyTodayVM.firstDayOfWeekForMonth(), id: \.self) { _ in
            Text(" ")
                .frame(maxWidth: .infinity, minHeight: 48)
        }
    }
    
}

#Preview {
    CalendarView()
}
