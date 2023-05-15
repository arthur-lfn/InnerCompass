//
//  CardView.swift
//  InnerCompass
//
//  Created by Arturo Alfani on 16/04/23.
//

import SwiftUI

struct CardView: View {
    @Binding var timer: Timer?
    @Binding var selectedCard: UUID
    @Binding var showConclusion: Bool

    var name: String
    var id: UUID
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: selectedCard == id ? 100 : 25)
                .frame(width: 150, height: 150)
            Text(name)
                .foregroundColor(.white)
                .fontWeight(.black)
        }
        .onTapGesture {
            withAnimation(.spring()) {
                selectedCard = id
            }
            
            stopTimer()
            startTimer()
        }
    }
    
    func startTimer() {
        guard timer == nil else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
            withAnimation {
                showConclusion = true
            }
        }
    }
    
    func stopTimer() {
      timer?.invalidate()
      timer = nil
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(timer: .constant(Timer()), selectedCard: .constant(UUID()), showConclusion: .constant(false), name: "Example Word", id: UUID())
    }
}
