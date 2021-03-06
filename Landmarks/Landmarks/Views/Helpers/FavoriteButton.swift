//
//  FavoriteButton.swift
//  playground
//
//  Created by Efren Mauricio on 2021/03/06.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        let action = { isSet.toggle() }
        Button(action: action) {
            Image(systemName: isSet ? "star.fill": "star")
                .foregroundColor(.yellow)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
