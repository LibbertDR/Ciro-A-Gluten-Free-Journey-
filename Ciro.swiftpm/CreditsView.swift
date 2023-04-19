//
//  CreditsView.swift
//  Ciro
//
//  Created by Alberto Di Ronza on 19/04/23.
// The game has to be tested in portrait orientation

import SwiftUI

struct CreditsView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                Text("Assets by: \nkicked-in-teeth.itch.io \npixelfrog-assets.itch.io \nlittle-martian.itch.io")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding()
            }//End Of ZStack
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
