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
    @State private var isBreak = false
    
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
                    .padding(.bottom, 5)
                Button(isBreak ? "Study" : "Break"){
                    isBreak.toggle()
                    timeRemaining = isBreak ? .BREAK_TIME : .STUDY_TIME
                }
                    .font(.largeTitle)
                    .padding(5)
                    .frame(width: geometry.size.width * 0.70)
                    .background(isBreak ? Color.Anti_flash_white : Color.tomato)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(isBreak ? Color.tomato : Color.Anti_flash_white).opacity(0.9)
                    .shadow(radius: 3)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(Color.onyx)
        }
    }
    
    func restartTimer() {
        isTimerPaused = true
        timeRemaining = isBreak ? .BREAK_TIME : .STUDY_TIME
    }
    func pauseTimer() {
        isTimerPaused = false
    }
    
    func updateTimer(){
        
        if timeRemaining == 0 {
            timeRemaining = isBreak ? .STUDY_TIME : .BREAK_TIME
            isBreak.toggle()
            isTimerPaused = true
        }
        else if timeRemaining > 0  && !isTimerPaused {
            timeRemaining -= 1
        }

    }
}

#Preview {
    TimeView()
}
