//
//  StartView.swift
//  Ciro
//
//  Created by Alberto Di Ronza on 19/04/23.
// The game has to be tested in portrait orientation

import SpriteKit
import SwiftUI

struct StartView: View {
    var body: some View {
//Creating the first view of th app. Here we have to possibility to access the game scene and other views filled with information about the app trough Navigation view and navigation link, all navigation views are adapted to not have the ipad sidebar. In the VStack are defined buttons and texts necessary to the UI and the navigation.
        NavigationView{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack{
                    Text("Ciro")
                        .fontWeight(.bold)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    Text("A Gluten Free Journey!")
                        .fontWeight(.bold)
                        .font(.system(size: 52))
                        .foregroundColor(.white)
                    Text("Ciro is a gluten intolerant bird, he is sad because he cannot eat the same things that his friends eat. Help him discover which crops he can eat without getting sick!")
                        .font(.system(size: 26))
                        .foregroundColor(.white)
                        .padding()
                    Text("Slide your finger on the screen to move Ciro and let him eat his gluten free crops.")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                    NavigationLink(destination: ContentView())
                    {
                        Text("Play")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                    }
                    NavigationLink(destination: AboutView())
                    {
                        Text("About")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                    }
                    NavigationLink(destination: CreditsView())
                    {
                        Text("Credits")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                    }
                }//End Of VStack
            }//End of ZStack
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
