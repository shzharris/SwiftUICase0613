//
//  HistoryTodayContentView.swift
//  InternetSync
//
//  Created by HarrisShao on 2025/6/13.
//

import SwiftUI

struct HistoryTodayContentView: View {
    
    @StateObject var historyTodayVM = HistoryTodayViewModel()
    
//    @State private var historyToday : [HistoryTodayModel] = [
//        HistoryTodayModel(id: 1, year: 2017, body: "你好呀你好呀你好呀你好呀你好呀你好呀你好呀你好呀你好呀你好呀你好呀")
//    ]
    
    
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                ForEach(historyTodayVM.historyDaily, id: \.id){ item in
                    TextItem(id: item.id, year: item.year, historyInfo: item.body)
                }
            }
            .navigationTitle("History Today!")
        }
        .onAppear {
            historyTodayVM.fetchHistoryTodayData()
        }
        
    }
    
}

struct TextItem :View {
    var id: Int
    var year: Int
    var historyInfo: String
    
    var body: some View {
        
        HStack(spacing: 10, content: {
            Text(String(year))
                .frame(maxWidth: 80, maxHeight: 120)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            Text(String(historyInfo))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, minHeight: 80)
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .lineLimit(2)
        })
        .padding(.horizontal)
        
    }
}

#Preview {
    HistoryTodayContentView()
}
