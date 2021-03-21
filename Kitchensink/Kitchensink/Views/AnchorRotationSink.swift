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
    @State private var rotationDegree: Double = 90.0
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

    func anchorName(_ point: UnitPoint) -> String {
        return anchorPoints.first(where: { $0.value == point })?.key ?? ""
    }

    var body: some View {
        VStack(alignment: .center) {
            VStack{
                Text("Double tap to reset")
                Slider(value: $rotationDegree, in: -360...360).onTapGesture(count: 2, perform: {
                    rotationDegree = 0
                })
                Text("Rotation: \(Int(rotationDegree))")
            }

            Divider()
            ScrollView{
                ForEach(Array(anchorPoints.keys.enumerated()), id: \.element) { index, key in
                    Button(action: {
                        currentPoint = anchorPoints[key] ?? .bottom
                        isAnimated.toggle()
                    }) {
                        Text(key).padding(10.0)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 1.0)
                    )
                    .foregroundColor(.blue)
                }
            }.frame(height: 250)

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
        AnchorRotationSink().preferredColorScheme(.light)
    }
}
