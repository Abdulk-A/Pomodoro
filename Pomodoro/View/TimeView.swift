//
//  TimeView.swift
//  Pomodoro
//
//  Created by Abdullah Abdulkareem on 5/16/24.
//

import SwiftUI

struct TimeView: View {
    
    @State var timeRemaining: Int = .STUDY_TIME
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var isTimerPaused = true
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                HStack {
                    Button(isTimerPaused ? "Start" : "Stop") {
                        withAnimation(.easeIn){
                            isTimerPaused.toggle()
                        }
                    }
                        .padding()
                        .frame(width: geometry.size.width*0.32)
                        .background(isTimerPaused ? .green : .red)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Spacer()
                    Button("Reset") {
                        withAnimation{
                            restartTimer()
                        }

                    }
                        .padding()
                        .frame(width: geometry.size.width*0.32)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .frame(maxWidth: geometry.size.width * 0.7)
                .opacity(0.9)
                .font(.system(size: geometry.size.width*0.08))
                .padding(.bottom)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.Anti_flash_white.opacity(isTimerPaused ? 0.8 : 1))
                    .frame(width: geometry.size.width * 0.70, height: geometry.size.height * 0.25)
                    .overlay {
                        Text("\(timeRemaining.formattedTime())")
                            .font(.system(size: geometry.size.width * 0.2))
                            .onReceive(timer) { _ in
                                updateTimer()
                            }
                    }
                    .shadow(radius: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(Color.onyx)
        }
    }
    
    func restartTimer() {
        isTimerPaused = true
        timeRemaining = .STUDY_TIME
    }
    func pauseTimer() {
        isTimerPaused = false
    }
    
    func updateTimer(){
        
        if timeRemaining > 0  && !isTimerPaused {
            timeRemaining -= 1
        }

    }
}

#Preview {
    TimeView()
}
