//
//  WinInfo.swift
//  TapTap!
//
//  Created by Piotr Cichowlas on 08/04/2020.
//  Copyright © 2020 Piotr Cichowlas. All rights reserved.
//

import SwiftUI

struct WinInfo: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // close view and return to main menu
    func exit(){
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var name: String = ""
    
    var body: some View {
        ZStack {
            Color(red: 190 / 255, green: 29 / 255, blue: 33 / 255)
            .edgesIgnoringSafeArea(.all)
            if name == "DRAW"{
                VStack{
                    Text(name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.bottom)
                    Button(action: {self.exit()}) {
                        Text("EXIT")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                    }
                }
            } else {
                if name == "BLUE PLAYER"{
                    Color(red: 29 / 255, green: 11 / 255, blue: 204 / 255)
                    .edgesIgnoringSafeArea(.all)
                }
                VStack {
                    Text(name + " WON!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.bottom)
                    Button(action: {self.exit()}) {
                        Text("EXIT")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                }
                
                }
            }
            
        }

        
    }
}

struct WinInfo_Previews: PreviewProvider {
    static var previews: some View {
        WinInfo()
    }
}
