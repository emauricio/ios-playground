//
//  ModelData.swift
//  playground
//
//  Created by Efren Mauricio on 2021/03/05.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = loadJson("landmarkData.json")
    var hikes: [Hike] = loadJson("hikeData.json")

    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }

    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}
