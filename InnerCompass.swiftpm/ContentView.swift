//
//  Emotions.swift
//  InnerCompass
//
//  Created by Arturo Alfani on 15/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var degree: Double = 0
    @State private var chosenIndex = 0
    @State private var currentCategory = emotions
    @State private var selectedCard = UUID()
    @State private var counter = 0
    @State private var opacity: Double = 0
    @State private var hintEnabled = true
    @State private var hintAnimationValue = 1.0
    @State private var showConclusion = false
    @State private var timer: Timer?
    
    private let columns = Array(repeating: GridItem(.fixed(150), spacing: 10), count: 6)

    var body: some View {
        if counter < introTexts.count {
            IntroductionView(opacity: $opacity, counter: $counter)
        } else {
            ZStack {
                ZStack(alignment: .top) {
                    DescriptionView(selectedCard: $selectedCard)
                }
                .offset(y: -300)
                .opacity(opacity).animation(.easeInOut.delay(3.0), value: opacity)
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(currentCategory) { emotion in
                        CardView(timer: $timer, selectedCard: $selectedCard, showConclusion: $showConclusion, name: emotion.name, id: emotion.id)
                    }
                }
                .opacity(showConclusion ? 0 : opacity).animation(.easeInOut.delay(2.5), value: opacity)
                .overlay {
                    if hintEnabled {
                        Text("Spin the wheel left or right")
                            .foregroundColor(.black)
                            .fontWeight(.black)
                            .font(.title3)
                            .opacity(2 - hintAnimationValue)
                            .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: hintAnimationValue)
                            .offset(y: -300 + (5 * hintAnimationValue))
                            .opacity(opacity).animation(.easeInOut.delay(5.5), value: opacity)
                    }
                }
                
                BigCardView(showConclusion: $showConclusion, selectedCard: $selectedCard)
                
                ZStack(alignment: .bottom) {
                    Color.orange.opacity(0.4).ignoresSafeArea()
                        .hueRotation(Angle(degrees: degree))
                        .allowsHitTesting(showConclusion ? true : false)
                        .onTapGesture {
                            withAnimation {
                                showConclusion = false
                            }
                        }
                    
                    WheelView(chosenIndex: $chosenIndex, degree: $degree, currentCategory: $currentCategory, hintEnabled: $hintEnabled, array: array, circleSize: 400)
                        .offset(y: 500 - (opacity * 230)).animation(.easeInOut(duration: 2.0), value: opacity)
                        .shadow(color: .white, radius: 40, x: 0, y: 0)
                }
            }
            .ignoresSafeArea()
            .onAppear {
                currentCategory = emotions.filter {$0.category == array[chosenIndex].val}
                hintAnimationValue = 2
            }
            .preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
