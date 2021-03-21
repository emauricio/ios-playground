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
            .foregroundColor(.blue)

    }

}

// MARK: Better way to style a button
struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 130)
            .padding(5)
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
            .cornerRadius(10.0)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2))
            .frame(width: 180)
    }
}


struct AnchorRotationSink: View {
    @State private var currentPoint: UnitPoint = .bottom
    @State private var rotationDegree: Double = 0.0
    @State private var isAnimated = false
    let rotationRange = -360.00...360.00

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

    func anchorName(_ point: UnitPoint) -> String {
        return anchorPoints.first(where: { $0.value == point })?.key ?? ""
    }


    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            VStack{
                Text("Double tap to reset")
                Slider(value: $rotationDegree, in: rotationRange)
                    .onTapGesture(count: 2, perform: { rotationDegree = 0 })
                    .animation(.easeOut)
                Text("Rotation: \(Int(rotationDegree))")
            }

            Divider()
            ScrollView{
                ForEach(Array(anchorPoints.keys.enumerated()), id: \.element) { index, key in
                    Button(action: {
                        currentPoint = anchorPoints[key] ?? .bottom
                        isAnimated.toggle()
                        rotationDegree = Double.random(in: rotationRange)
                    }) {
                        Text("\(key)")
//                            .font(currentPoint == anchorPoints[key] ? .body : .caption2)
                    }
                    .buttonStyle(BlueButton())
                }
            }.frame(width: 300, height: 200)

            Divider()
            HStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .modifier(CustomOverlayText(overlayText: anchorName(currentPoint)))
                    .rotationEffect(.degrees(rotationDegree), anchor: currentPoint)
                    .animation(.easeIn(duration: 0.5))
            }
            .border(Color(.label))
            // Color(.label) give me the oposite color to the theme
        }
        .padding()

    }

}

struct AnchorRotationSink_Previews: PreviewProvider {
    static var previews: some View {
        AnchorRotationSink()
            .preferredColorScheme(.light)
    }
}
