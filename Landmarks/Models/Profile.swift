//
//  Profile.swift
//  Landmarks
//
//  Created by Efren Mauricio on 2021/03/11.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let `default` = Profile(username: "Banana " + String("Banana".reversed()))

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍁"
        case winter = "☃️"
        var id: String { self.rawValue }
    }

}
