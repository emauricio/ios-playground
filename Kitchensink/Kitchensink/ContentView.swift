//
//  ContentView.swift
//  Kitchensink
//
//  Created by Efren Mauricio on 2021/03/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: ScrollViewReaderSink(),
                    label: {
                        Text("ScrollViewReader + ScrollView + ScrollTo")
                    })

            }.navigationTitle("Samples")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
