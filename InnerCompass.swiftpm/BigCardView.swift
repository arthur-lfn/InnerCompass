//
//  BigCardView.swift
//  InnerCompass
//
//  Created by Arturo Alfani on 19/04/23.
//

import SwiftUI

struct BigCardView: View {
    @State private var opacity: Double = 0
    
    @Binding var showConclusion: Bool
    @Binding var selectedCard: UUID
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 950, height: 470)
                .opacity(0.3)
                .shadow(color: .white, radius: 4, x: 0, y: 0)
            if let emotion = emotions.first(where: {$0.id == selectedCard}) {
                VStack(alignment: .leading) {
                    Text("Take a moment, and notice if this sounds like how you feel")
                        .padding()
                    
                    Text("Emotions are your friends, they can guide you when they are accepted without judgment")
                        .padding()
                    
                    if emotion.category == "HighPleasant" {
                        Text("If you feel \(emotion.name.lowercased()),\n\(conclusionTexts[0])")
                            .padding()
                    } else if emotion.category == "LowPleasant" {
                        Text("If you feel \(emotion.name.lowercased()),\n\(conclusionTexts[1])")
                            .padding()
                    } else if emotion.category == "LowUnpleasant" {
                        Text("If you feel \(emotion.name.lowercased()),\n\(conclusionTexts[2])")
                            .padding()
                    } else {
                        Text("If you feel \(emotion.name.lowercased()),\n\(conclusionTexts[3])")
                            .padding()
                    }
                }
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.black)
                .frame(width: 950, height: 470)
            }
        }
        .overlay {
            Triangle()
                .frame(width: 60, height: 30)
                .opacity(0.3)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: 250)
        }
        .opacity(showConclusion ? 1.0 : 0)
        .onTapGesture {
            withAnimation() {
                showConclusion = false
            }
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct BigCardView_Previews: PreviewProvider {
    static var previews: some View {
        BigCardView(showConclusion: .constant(true), selectedCard: .constant(emotions[0].id))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
