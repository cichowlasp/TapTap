//
//  PlayWithFrinedView.swift
//  TapTap!
//
//  Created by Piotr Cichowlas on 07/04/2020.
//  Copyright © 2020 Piotr Cichowlas. All rights reserved.
//

import SwiftUI

struct player{
    var name: String
    var score = 100
}

struct PlayWithFrinedView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var playerblue = player(name: "BLUE PLAYER")
    @State var playerred = player(name: "RED PLAYER")
    @State var wininfo = false
    
    // close view and return to main menu
    func exit(){
        self.presentationMode.wrappedValue.dismiss()
    }
    
    // check if someone ended game
    func checkifend(){
        if playerred.score == 0 || playerblue.score == 0{
            withAnimation {
                self.wininfo = true;
            }
        }
    }
    
    // return who won the game
    func checkwhowin()->String{
        
        if playerblue.score == 0 && playerred.score != 0{
            return playerblue.name
        }
        
        if playerred.score == 0 && playerblue.score != 0{
            return playerred.name
        }
        
        return "DRAW"
    }
    
    var body: some View {
        ZStack {
            
            //Background
            VStack(spacing: 0) {
                
                //Red color
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color(red: 190 / 255, green: 29 / 255, blue: 33 / 255))
                //Blue color
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(Color(red: 29 / 255, green: 11 / 255, blue: 204 / 255))
            }
            
            // VS and Exit button
            VStack {
                Text("VS")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            
                Button(action: {self.exit()}) {
                    Text("EXIT")
                        .font(.title)
                        .foregroundColor(Color.white)
                }.padding(.top)
            }.padding(.top, 50)
            
            //Game layout(Buttons and score!)
            VStack(alignment: .center){
                Spacer()
                
                //redplayer button
                Button(action: {
                    self.playerred.score -= 1
                    self.checkifend()
                    
                }) {
                Image("buttonred")
                    .renderingMode(.original)
                    .clipShape(Circle())
                    .rotationEffect(.degrees(180))
                }.disabled(wininfo)
                Spacer()
                
                //Score texts
                HStack(alignment: .center){
                    Text(String(playerred.score))
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.top, 40)
                        .rotationEffect(.degrees(180))
                            
                    Spacer()
                        
                    Text(String(playerblue.score))
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.top, 40)
                }
                .padding(.horizontal)
                
                Spacer()
                
                //blue player button
                Button(action: {
                    self.playerblue.score -= 1
                    self.checkifend()
                }) {
                Image("buttonblue")
                    .renderingMode(.original)
                    .clipShape(Circle())
                    .fixedSize()
                }.disabled(wininfo)
                
                Spacer()
            }
            .padding(.vertical, -60)
            
            //This if show information who won
            if (self.wininfo){
                WinInfo(name: self.checkwhowin())
                    .transition(.move(edge: .top))
            }
            
        }
    }
}

struct PlayWithFrinedView_Previews: PreviewProvider {
    static var previews: some View {
        PlayWithFrinedView()
    }
}
