//
//  ContentView.swift
//  luminome Watch App
//
//  Created by Myles Nottingham on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var scrollAmount = 40.0
    @State var backgroundToggle = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
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
                Color.white
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
            Timer.scheduledTimer(withTimeInterval:scrollAmount/60, repeats: true) {
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
