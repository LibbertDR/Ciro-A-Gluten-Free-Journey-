//
//  AboutView.swift
//  Ciro
//
//  Created by Alberto Di Ronza on 19/04/23.
// The game has to be tested in portrait orientation

import SwiftUI
import SpriteKit
//Dispaying the main game scene
struct AboutView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack{
                    Text("The intentions behind this fun little game are the awareness-raising towards the issue of gluten intolerance, empathization with celiac people who are naturally forced to eat gluten-free foods and also the possibility to teach what are some of the most common cereals containing gluten (in our case: wheat, barley, kamut, spelt), obviously used also for the production of complex foods (pizza, beer etc.) and which ones are gluten-free (in our case: corn, rice, quinoa).")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .padding()
                    HStack{
                        Image("Corn")
                            .resizable()
                            .frame(width: 50 , height: 50)
                        Text("Corn")
                            .foregroundColor(.white)
                    }//End Of HStack
                    HStack{Image("Rice")
                            .resizable()
                            .frame(width: 50 , height: 50)
                        Text("Rice")
                            .foregroundColor(.white)
                    }//End Of HStack
                    HStack{Image("Quinoa")
                            .resizable()
                            .frame(width: 50 , height: 50)
                        Text("Quinoa")
                            .foregroundColor(.white)
                    }//End Of HStack
                    HStack{Image("Kamut")
                            .resizable()
                            .frame(width: 50 , height: 50)
                        Text("Kamut")
                            .foregroundColor(.white)
                    }//End Of HStack
                    HStack{Image("Barley")
                            .resizable()
                            .frame(width: 50 , height: 50)
                        Text("Barley")
                            .foregroundColor(.white)
                    }//End Of HStack
                    HStack{Image("Wheat")
                            .resizable()
                            .frame(width: 50 , height: 50)
                        Text("Wheat")
                            .foregroundColor(.white)
                    }//End Of HStack
                    HStack{Image("Spelt")
                            .resizable()
                            .frame(width: 50 , height: 50)
                        Text("Spelt")
                            .foregroundColor(.white)
                    }//End Of HStack
                }//End Of VStack
            }//End Of ZStack
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
