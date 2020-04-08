//
//  PlayAloneView.swift
//  TapTap!
//
//  Created by Piotr Cichowlas on 07/04/2020.
//  Copyright © 2020 Piotr Cichowlas. All rights reserved.
//

import SwiftUI

struct PlayAloneView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var score = 0
    @State var title = "  "
    func changetitle(){
        if score == 50 {title = "Nice!"}

        if score == 100 {title = "Are you bored?"}

        if score == 150 {title = "Can you score 1000?"}

        if score == 420 {title = "Go green :P"}
        
        if score == 666 {title = "Satan?"}

        if score == 1000 {title = "Really are you still tapping?!"}

        if score == 1200 {title = "I will tell you something... "}

        if score == 1300 {title = "if u socore 10000."}

        if score == 10000 {title = "You are crazy :P"}
    }
    var body: some View {
        ZStack {
            Color(red: 190 / 255, green: 29 / 255, blue: 33 / 255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text("SCORE")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                Text(String(score))
                    .font(.system(size: 80))
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                Text(title)
                    .font(.title)
                    .foregroundColor(Color.white)
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                Text("EXIT")
                    .font(.title)
                    .foregroundColor(Color.white)
                }.offset(y: 10)
                Spacer()
                Button(action: {
                    self.score += 1
                    self.changetitle()
                }) {
                    Image("buttonred")
                        .renderingMode(.original)
                        .clipShape(Circle())
                        .animation(/*@START_MENU_TOKEN@*/.easeOut/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                
            }
            .padding()
        }
    }
}





struct PlayAloneView_Previews: PreviewProvider {
    static var previews: some View {
        PlayAloneView()
    }
}
