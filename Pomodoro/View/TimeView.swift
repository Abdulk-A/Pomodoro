//
//  TimeView.swift
//  Pomodoro
//
//  Created by Abdullah Abdulkareem on 5/16/24.
//

import SwiftUI

struct TimeView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.tomato)
                    .frame(width: geometry.size.width * 0.70, height: geometry.size.height * 0.25)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(Color.onyx, lineWidth: 0.5)
                        
                        Text("12:22")
                            .font(.system(size: geometry.size.width * 0.2))
                            .foregroundStyle(Color.onyx)
                    }
                    .shadow(radius: 15)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    TimeView()
}
