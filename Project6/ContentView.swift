//
//  ContentView.swift
//  Project6
//
//  Created by Paul Hudson on 17/02/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("Tap Me") {
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.default)
//        .animation(.interpolatingSpring(stiffness: 50, damping: animationAmount))
//        .animation(.easeInOut(duration: 2), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 2)
//            .delay(1),
//            value: animationAmount
//        )
        .animation(
            .easeInOut(duration: 1)
            .repeatForever(autoreverses: true),
//            .repeatCount(3, autoreverses: true),
            value: animationAmount
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
