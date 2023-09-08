//
//  ContentView.swift
//  luminome Watch App
//
//  Created by Myles Nottingham on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var scrollAmount = 60.0
    @State var backgroundToggle = false
    
    var body: some View {
        ZStack {
            if backgroundToggle {
                Color.black
                    .ignoresSafeArea()
                    .overlay(Text(" \(Int(scrollAmount)) BPM")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .focusable(true)
                        .digitalCrownRotation($scrollAmount, from: 40, through: 208, by: 2, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                    )
            } else {
                Color.gray
                    .ignoresSafeArea()
                    .overlay(Text(" \(Int(scrollAmount)) BPM")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .focusable(true)
                        .digitalCrownRotation($scrollAmount, from: 40, through: 208, by: 2, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                    )
            }
        }.onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval:60/scrollAmount, repeats: true) {
                time in
                backgroundToggle.toggle()
            }
        }
        )
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
