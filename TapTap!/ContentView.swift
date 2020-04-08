//
//  ContentView.swift
//  TapTap!
//
//  Created by Piotr Cichowlas on 06/04/2020.
//  Copyright © 2020 Piotr Cichowlas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 190 / 255, green: 29 / 255, blue: 33 / 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("TapTap!")
                        .font(.system(size: 100))
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)
                        .foregroundColor(Color.black)
                    Spacer()
                    VStack {
                        NavigationLink(destination: PlayAloneView().navigationBarTitle("")
                        .navigationBarHidden(true)) {
                            Text("PLAY ALONE")
                            .font(.title)
                            .fontWeight(.light)
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                        }
                        NavigationLink(destination: PrepareToMultiplayer().navigationBarTitle("")
                        .navigationBarHidden(true)) {
                            Text("PLAY WITH FRIEND")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                        }
                        .padding(.top)
                    }.offset(y: -50)
                    Spacer()
                    Text("Made by Piotr Cichowlas")
                        .font(.footnote)
                        .foregroundColor(Color.black)
                }.offset(y: 30).padding(.bottom, 70)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
