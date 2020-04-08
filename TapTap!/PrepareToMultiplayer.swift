//
//  PrepareToMultiplaayer.swift
//  TapTap!
//
//  Created by Piotr Cichowlas on 08/04/2020.
//  Copyright © 2020 Piotr Cichowlas. All rights reserved.
//

import SwiftUI

struct PrepareToMultiplayer: View {
    @State var gomulti = false;
    @State var timeRemaining = "3"
    @State var displayedtext = "3"
    @State var currentDate = Date()
    @State var timer: Timer.TimerPublisher = Timer.publish (every: 0.6, on: .main, in: .common)

    var body: some View {
        ZStack{
            Color(red: 190 / 255, green: 29 / 255, blue: 33 / 255)
                .edgesIgnoringSafeArea(.all)
            Text(self.displayedtext)
                .font(.system(size: 100))
                .font(.largeTitle)
                .fontWeight(.light)
                .foregroundColor(Color.white)
                .onReceive(timer) { _ in
                    if self.timeRemaining != "GO!" {
                    self.timeRemaining = String(Int(self.timeRemaining)! - 1)
                        self.displayedtext = self.timeRemaining
                        if self.timeRemaining == "0"{
                            self.displayedtext = "GO!"
                        }
                        if self.timeRemaining == "-1"{
                            self.timeRemaining = "GO!"
                            self.timer.connect().cancel()
                            self.gomulti = true
                        }
                     
                        
                }
            }
            //Go to playwithfriendsection
            if (self.gomulti){
                PlayWithFrinedView()
            }
        }.onAppear(perform: {
            self.timer = Timer.publish (every: 0.6, on: .main, in: .common)
        self.timer.connect()
        })
    }
}
struct PrepareToMultiplaayer_Previews: PreviewProvider {
    static var previews: some View {
        PrepareToMultiplayer()
    }
}
