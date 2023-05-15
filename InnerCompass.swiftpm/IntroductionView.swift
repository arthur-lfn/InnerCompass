//
//  IntroductionView.swift
//  InnerCompass
//
//  Created by Arturo Alfani on 17/04/23.
//

import SwiftUI

struct IntroductionView: View {
    @State private var hintEnabled = false
    @State private var hintAnimationValue = 1.0
    
    @Binding var opacity: Double
    @Binding var counter: Int
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                VStack {
                    Rectangle()
                        .fill(.clear)
                        .frame(width: geo.size.width, height: geo.size.height / 2)
                    Text(counter < introTexts.count ? introTexts[counter] : "")
                        .foregroundColor(.black)
                        .font(.system(size: 50, weight: .black))
                        .opacity(opacity)
                        .frame(width: geo.size.width - 300, alignment: .top)
                        .offset(y: -50)
                        .onAppear {
                            hintAnimationValue = 2
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                                withAnimation {
                                    opacity = 1
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                                withAnimation {
                                    hintEnabled = true
                                }
                            }
                        }
                }
                .ignoresSafeArea()
                .overlay(alignment: .top) {
                    Text("Tap anywhere to continue")
                        .foregroundColor(.black)
                        .fontWeight(.black)
                        .font(.title3)
                        .offset(y: geo.size.height - 200)
                        .opacity(hintEnabled ? 1 : 0)
                }
                
                Color.orange.opacity(0.4).ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            opacity = 0
                            hintEnabled = false
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            counter += 1
                            
                            withAnimation {
                                opacity = 1
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            withAnimation {
                                hintEnabled = true
                            }
                        }
                    }
                    .allowsHitTesting(opacity == 1 ? true : false)
            }
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(opacity: .constant(1.0), counter: .constant(0))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
