//
//  AnchorRotation.swift
//  Kitchensink
//
//  Created by Efren Mauricio on 2021/03/20.
//

import SwiftUI


struct CustomOverlayText: ViewModifier {
    var overlayText = "Sample"

    func body(content: Content) -> some View {
        return content
            .overlay(
                Text(overlayText).foregroundColor(.white)
            )
            .frame(width: 100, height: 100)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

    }

}


struct AnchorRotationSink: View {
    @State private var currentPoint: UnitPoint = .bottom
    @State private var isAnimated = false

    // TODO: kimochi warui, find nicer way
    let anchorPoints: [String: UnitPoint] = [
        ".bottom": .bottom,
        ".bottomLeading": .bottomLeading,
        ".bottomTrailing": .bottomTrailing,
        ".center": .center,
        ".leading": .leading,
        ".top": .top,
        ".topLeading": .topLeading,
        ".topTrailing": .topTrailing,
    ]

    var body: some View {
        VStack(alignment: .center) {
            ForEach(Array(anchorPoints.keys.enumerated()), id: \.element) { index, key in
                Button(action: {
                    currentPoint = anchorPoints[key] ?? .bottom
                    isAnimated.toggle()
                }) {
                    Text(key).padding(10.0)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 1.0)
                )
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }

            HStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .modifier(CustomOverlayText())
                    .rotationEffect(.degrees(isAnimated ? -90: 0), anchor: currentPoint)
                    .animation(.easeIn(duration: 0.5))
            }
            .frame(width: 350, height: 100, alignment: .center)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)

        }
        .frame(width: 350, height: 614)

    }

}

struct AnchorRotationSink_Previews: PreviewProvider {
    static var previews: some View {
        AnchorRotationSink()
    }
}
