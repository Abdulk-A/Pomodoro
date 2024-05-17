//
//  TabbedItems.swift
//  Pomodoro
//
//  Created by Abdullah Abdulkareem on 5/16/24.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case studyTime = 0
    case settings
    
    var title: String {
        switch self {
        case .studyTime:
            "Study"
        case .settings:
            "Settings"
        }
    }
    
    var iconName: String {
        switch self {
        case .studyTime:
            "clock"
        case .settings:
            "gear"
        }
    }
}

extension ContentView {
    func CustomTabItem2(imageName: String, title: String, isActive: Bool) -> some View {
        HStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(
                    width: isActive ? 60 : 50,
                    height: isActive ? 60 : 50
                )
                .foregroundStyle( isActive ? Color.sandy_brown.opacity(0.8) :
                    Color.sandy_brown.opacity(0.6)
                )
            Spacer()
        }
    }
}
