//
//  MapView.swift
//  GreenThumb
//
//  Created by MacBook Pro on 29/05/24.
//

import SwiftUI
import MapKit

//struct MapView: View {
//    let plants: [Plant]
//
//    var body: some View {
//        Map(initialRegion: region)
//    }
//
//    private var region: MKCoordinateRegion {
//        if let firstPlant = plants.first {
//            return MKCoordinateRegion(
//                center: CLLocationCoordinate2D(latitude: firstPlant.latitude, longitude: firstPlant.longitude),
//                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
//            )
//        } else {
//            // Default region if there are no plants
//            return MKCoordinateRegion(
//                center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
//                span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
//            )
//        }
//    }
//}
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        let plants = loadPlants()
//        return MapView(plants: plants)
//    }
//}
//
//func loadPlants() -> [Plant] {
//    if let fileURL = Bundle.main.url(forResource: "plantData", withExtension: "json") {
//        do {
//            let data = try Data(contentsOf: fileURL)
//            let plants = try JSONDecoder().decode([Plant].self, from: data)
//            return plants
//        } catch {
//            print("Error reading JSON file: \(error)")
//        }
//    }
//    return []
//}

//#Preview {
//    let plants = ModelData().loadPlants
//    
//    return Group {
//        MapView(plants: plants[6])
//    }
//}

