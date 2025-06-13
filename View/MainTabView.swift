//
//  MainTabView.swift
//  InternetSync
//
//  Created by HarrisShao on 2025/6/13.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
    
        TabView {
            HistoryTodayContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calender")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("My")
                }
        }
        
    }
}

#Preview {
    MainTabView()
}
