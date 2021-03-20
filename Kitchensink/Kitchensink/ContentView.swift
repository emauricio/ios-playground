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
                NavigationLink(destination: ScrollViewReaderSink()){
                    Text("ScrollViewReader + ScrollView + ScrollTo")
                }
                NavigationLink(destination: AnchorRotationSink()){
                    Text("Anchor + Rotation point")
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
