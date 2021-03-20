//
//  ScrollViewReader.swift
//  kitchen-sink
//
//  Created by Efren Mauricio on 2021/03/19.
//

import SwiftUI

func color(fraction: Double) -> Color {

    Color(red: fraction , green: 1 - fraction , blue: 0.5)
}


struct StepperView: View {
    @Binding var itemNumber: Int
    let range: ClosedRange<Int>
    let proxy: ScrollViewProxy

    var body: some View {
        HStack {
            Stepper(value: $itemNumber, in: range, step: 2) {
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
        .padding(20)
    }
}


struct ScrollViewReaderSink: View {
    @State private var itemNumber = 1
    let range =  1...100

    var body: some View {
        GeometryReader { fullView in
            ScrollViewReader { proxy in
                StepperView(itemNumber: $itemNumber, range: range, proxy: proxy)
                ScrollView {
                    ForEach(range, id: \.self) { block in
                        GeometryReader { geo in
                            Button(
                                action: {
                                    withAnimation {
                                        proxy.scrollTo(1)
                                    }
                                }){
                                Text("Block \(block)")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.black)
                                    .frame(width: fullView.size.width, height: geo.size.height)
                                    .background(color(fraction: Double(block) / Double(range.count)))
                            }
                            .rotation3DEffect(
                                .degrees(Double(geo.frame(in: .global).minY - fullView.size.height / 2) / 5),
                                axis: (x: 0.0, y: 2.0, z: 0.0)
                            )
                        }
                        .frame(height: 100)
                    }
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
