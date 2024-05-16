//
//  Plant.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import Foundation

import SwiftUI

struct Plant: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var isFeatured: Bool
    var isOutdoor: Bool
    var age: Int
    var plantingAge: Int
    var wateringTime: String
    var plantingSteps: String
    var isWatered: Bool // Atribut baru
    
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
//    
//    var featureImage: Image? {
//        isFeatured ? Image(imageName + "_feature") : nil
//    }
//
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
}
