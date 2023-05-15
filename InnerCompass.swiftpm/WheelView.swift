//
//  WheelView.swift
//  InnerCompass
//
//  Created by Arturo Alfani on 16/04/23.
//

import SwiftUI

struct wheelStatus: Equatable {
    let id = UUID()
    let val: String
}

let array: [wheelStatus] = [
    wheelStatus(val: "HighPleasant"),
    wheelStatus(val: "LowPleasant"),
    wheelStatus(val: "LowUnpleasant"),
    wheelStatus(val: "HighUnpleasant")
]

enum wheelDirection {
    case left
    case right
}

struct WheelView: View {
    @State private var radius: Double = 150
    @State private var direction = wheelDirection.left
    
    @Binding var chosenIndex: Int
    @Binding var degree: Double
    @Binding var currentCategory: [Emotion]
    @Binding var hintEnabled: Bool
    
    let array: [wheelStatus]
    let circleSize: Double

    var body: some View {
        let anglePerCount = Double.pi * 2.0 / Double(array.count)
        let drag = DragGesture()
            .onEnded { value in
                if value.startLocation.x > value.location.x + 10 {
                    direction = .right
                } else if value.startLocation.x < value.location.x - 10 {
                    direction = .left
                }
                moveWheel()
            }
        
        ZStack {
            Circle()
                .fill(EllipticalGradient(colors: [.orange,.yellow]))
                .hueRotation(Angle(degrees: degree))

            ForEach(0..<array.count, id: \.self) { index in
                let angle = Double(index) * anglePerCount
                let xOffset = CGFloat(radius * sin(angle))
                let yOffset = CGFloat(-radius * cos(angle))
                Image("\(array[index].val)")
                    .resizable()
                    .frame(width: 177, height: 49)
                    .rotationEffect(Angle(degrees:
                        index == 0 ? 0 : index == 1 ? 90 : index == 2 ? 180 : 270
                     ))
                    .opacity(index == chosenIndex ? 1.0 : 0)
                    .offset(x: xOffset, y: yOffset)
            }
        }
        .rotationEffect(Angle(degrees: -degree))
        .gesture(drag)
        .frame(width: circleSize, height: circleSize)
        .onAppear() {
            radius = circleSize/2 - 60
        }
    }
    
    func moveWheel() {
        withAnimation(.spring()) {
            if direction == .left {
                degree -= Double(360/array.count)
                if chosenIndex == 0 {
                    chosenIndex = array.count-1
                } else {
                    chosenIndex -= 1
                }
            } else {
                degree += Double(360/array.count)
                if chosenIndex == array.count-1 {
                    chosenIndex = 0
                } else {
                    chosenIndex += 1
                }
            }
        }
        currentCategory = emotions.filter {$0.category == array[chosenIndex].val}
        hintEnabled = false
    }
}
