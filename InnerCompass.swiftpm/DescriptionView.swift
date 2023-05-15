//
//  DescriptionView.swift
//  InnerCompass
//
//  Created by Arturo Alfani on 17/04/23.
//

import SwiftUI

struct DescriptionView: View {
    @Binding var selectedCard: UUID
    
    var body: some View {
        if let emotion = emotions.first(where: {$0.id == selectedCard}) {
            Text(emotion.description)
                .foregroundColor(.black)
                .fontWeight(.black)
                .font(.largeTitle)
                .frame(width: 950, height: 200, alignment: .top)
        } else {
            Text("Tap the word that best describes how you feel right now")
                .foregroundColor(.black)
                .fontWeight(.black)
                .font(.largeTitle)
                .frame(width: 950, height: 200, alignment: .top)
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(selectedCard: .constant(UUID()))
    }
}
