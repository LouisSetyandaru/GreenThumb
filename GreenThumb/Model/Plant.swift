//
//  Plant.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import Foundation
import CoreLocation
import SwiftUI

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

struct Plant: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var plant_type: String
    var latin_name: String
    var habitat: String
    var description: String
    var isFeatured: Bool
    var isOutdoor: Bool
    var age: Int
    var plantingAge: Int
    var wateringTime: String
    var wateringCount: Int
    var plantingSteps: String
    var isWatered: Bool
    var image: String
    var isOnList: Bool
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    var store_image: String
    var store_name: String
    var store_address: String
    
    
    
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
