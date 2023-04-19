//
//  ContentView.swift
//  Ciro
//
//  Created by Alberto Di Ronza on 15/04/23.
// The game has to be tested in portrait orientation

import SwiftUI
import SpriteKit
//Dispaying the main game scene
struct ContentView: View {
    var scene: SKScene {
        let gameScene = GameScene()
        gameScene.size = CGSize(width: 300, height: 400)
        gameScene.scaleMode = .resizeFill
        gameScene.scaleMode = .fill
        gameScene.scaleMode = .aspectFill
        return gameScene
    }
    
    var body: some View {
        NavigationView{
            SpriteView(scene: scene)
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
