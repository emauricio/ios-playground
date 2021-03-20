//
//  ScrollViewReader.swift
//  kitchen-sink
//
//  Created by Efren Mauricio on 2021/03/19.
//

import SwiftUI

func color(fraction: Double) -> Color {
    Color(red: fraction, green: 1 - fraction , blue: 0.5)
}



struct ScrollViewReaderSink: View {
    @State private var itemNumber = 1
    @Namespace var topStack


    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                HStack {
                    Stepper(value: $itemNumber) {
                        Text("Jump to item: ")
                    }
                    Button {
                        withAnimation {
                            proxy.scrollTo(itemNumber)
                        }
                    }  label: {
                        Text("\(itemNumber)")
                    }

                }
                .padding()
                .id(topStack)


                ForEach(1..<10) { block in

                    Button(action: { withAnimation {
                            proxy.scrollTo(topStack)}}){
                        Text("Block \(block)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 300)
                    .background(color(fraction: Double(block) / 10  ))
                    .id(block)
                }
            }
        }

    }
}


struct ScrollViewReaderSink_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderSink()
    }
}
