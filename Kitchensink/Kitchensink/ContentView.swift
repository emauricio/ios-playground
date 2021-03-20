//
//  ContentView.swift
//  Kitchensink
//
//  Created by Efren Mauricio on 2021/03/19.
//

import SwiftUI

// MARK: Menu model
struct Menu: Identifiable {
    var id = UUID()
    var name: String
    var view: AnyView
}

struct ContentView: View {

    var menu: [Menu] = [
        Menu(name: "ScrollViewReader + ScrollView + ScrollTo", view: AnyView(ScrollViewReaderSink())),
        Menu(name: "Anchor and rotation", view: AnyView(AnchorRotationSink()))
    ]

    var body: some View {
        NavigationView {
            List(menu) { menuItem in
                NavigationLink(destination: menuItem.view ){
                    Text(menuItem.name)
                }
            }.navigationTitle("Samples")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
