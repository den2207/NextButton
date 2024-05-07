//
//  ContentView.swift
//  NextButton
//
//  Created by Denys Okhremenko on 05.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    @State var animationCount = 3
    
    var body: some View {
        VStack {
            Button(action: {
                showAnimate()
            }, label: {
                HStack(spacing: .zero) {
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .opacity(isTapped ? 1 : 0)
                        .frame(width: isTapped ? 40 : 0, height: isTapped ? 40 : 0)
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .opacity(isTapped ? 0 : 1)
                        .frame(width: isTapped ? 1 : 40, height: isTapped ? 1 : 40)
                }
            })
        }
        .padding()
    }
    
    func showAnimate() {
        animationCount -= 1
        withAnimation(.smooth(extraBounce: 0.4)) {
            isTapped = true
        } completion: {
            isTapped = false
            if animationCount > 0 {
                showAnimate()
            } else {
                animationCount = 3
            }
        }
    }
}

#Preview {
    ContentView()
}
