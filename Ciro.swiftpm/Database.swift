//
//  Database.swift
//  Ciro
//
//  Created by Alberto Di Ronza on 14/04/23.
// The game has to be tested in portrait orientation


import Foundation

public struct Crops {
    let cropType: String
}

let wheat: Crops = Crops(cropType: "Wheat")
let kamut: Crops = Crops(cropType: "Kamut")
let spelt: Crops = Crops(cropType: "Spelt")
let barley: Crops = Crops(cropType: "Barley")
let rice: Crops = Crops(cropType: "Rice")
let corn: Crops = Crops(cropType: "Corn")
let quinoa: Crops = Crops(cropType: "Quinoa")

//Dividing glutenfree crops and not gf crops to identify them while randomly genereting 
public var possibleNgfCrops : [Crops] = [wheat, kamut, spelt, barley]
public var possibleGfCrops : [Crops] = [corn, rice, quinoa]
