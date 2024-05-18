//
//  ContentView.swift
//  Pomodoro
//
//  Created by Abdullah Abdulkareem on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    @State private var studyTime = 25
    @State private var breakTime = 5
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    TimeView(studyTime:  studyTime.minToSec, breakTime: breakTime.minToSec).tag(0)
                    SettingsView(studyMins: $studyTime, brekaMins: $breakTime).tag(1)
                }
            }
            ZStack {
                HStack {
                    ForEach(TabbedItems.allCases, id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem2(imageName: item.iconName, title: item.title, isActive: selectedTab == item.rawValue)
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 70)
            .background(Color.sandy_brown.opacity(0.2))
            .cornerRadius(35)
            .padding(.horizontal, 26)
            .padding(.bottom)
            
        }
        .ignoresSafeArea()

    }
}

#Preview {
    ContentView()
}
