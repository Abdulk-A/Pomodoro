//
//  SettingsView.swift
//  Pomodoro
//
//  Created by Abdullah Abdulkareem on 5/17/24.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var studyMins = 25
    @State private var brekaMins = 5
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                Form {
                    Section("Study Time"){
                        Picker(selection: $studyMins, label: Text("Picker")) {
                            ForEach(0...120, id: \.self) { min in
                                Text("\(min)")
                                    .font(.system(size: geometry.size.height * 0.03))
                            }
                        }
                        .pickerStyle(.wheel)
                        
                    }
                    .font(.system(size: geometry.size.width * 0.06))
                    .foregroundStyle(.blue)
                    
                    Section("Break Time"){
                        Picker(selection: $brekaMins, label: Text("Picker")) {
                            ForEach(0...30, id: \.self) { min in
                                Text("\(min)")
                                    .font(.system(size: geometry.size.height * 0.03))
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    .font(.system(size: geometry.size.width * 0.06))
                    .foregroundStyle(.red)
                }
                .scrollContentBackground(.hidden)
                .background(.white)
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
                
                .padding(.top, geometry.size.height * 0.13)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SettingsView()
}
