//
//  ContentView.swift
//  luminome Watch App
//
//  Created by Myles Nottingham on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var scrollAmount = 40.0

    var body: some View {
        HStack {
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
        .colorInvert()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
