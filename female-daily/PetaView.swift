//
//  PetaView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 24/07/25.
//

import SwiftUI

struct PetaView: View {
    let image = Image("petajxb")

    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    @State private var angle: Angle = .degrees(0)
    
    var body: some View {
        GeometryReader { geo in
            let screenSize = geo.size
            let isVertical = Int(angle.degrees) % 180 != 0
            let adjustedSize = CGSize(
                width: isVertical ? screenSize.height : screenSize.width,
                height: isVertical ? screenSize.width : screenSize.height
            )

            ZStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(angle)
                    .scaleEffect(scale)
                    .offset(offset)
                    .frame(width: adjustedSize.width, height: adjustedSize.height)
                    .background(Color.black.opacity(0.01))
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                scale = min(max(value * scale, 1), 10)
                            }
                            .onEnded { _ in
                                limitOffset(screenSize: adjustedSize)
                            }
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if scale > 1 {
                                    offset = CGSize(
                                        width: lastOffset.width + value.translation.width,
                                        height: lastOffset.height + value.translation.height
                                    )
                                }
                            }
                            .onEnded { _ in
                                lastOffset = offset
                                limitOffset(screenSize: adjustedSize)
                            }
                    )
                    .animation(.easeInOut, value: angle)
                    .animation(.easeInOut, value: scale)
                    .animation(.easeInOut, value: offset)

                alatKontrol
            }
            .frame(width: screenSize.width, height: screenSize.height)
        }
    }

    var alatKontrol: some View {
        VStack {
            Spacer()
            HStack(spacing: 15) {
                Button {
                    scale = min(scale + 0.5, 10)
                } label: {
                    Image(systemName: "plus.magnifyingglass")
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }

                Button {
                    scale = max(scale - 0.5, 1)
                    if scale == 1 {
                        offset = .zero
                        lastOffset = .zero
                    }
                } label: {
                    Image(systemName: "minus.magnifyingglass")
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }

                Button {
                    withAnimation {
                        angle += .degrees(90)
                        scale = 1.0
                        offset = .zero
                        lastOffset = .zero
                    }
                } label: {
                    Image(systemName: "rotate.right")
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }
            }
            .padding()
        }
    }

    private func limitOffset(screenSize: CGSize) {
        let imageWidth = screenSize.width * scale
        let imageHeight = screenSize.height * scale

        let maxX = max((imageWidth - screenSize.width) / 2, 0)
        let maxY = max((imageHeight - screenSize.height) / 2, 0)

        offset.width = min(max(offset.width, -maxX), maxX)
        offset.height = min(max(offset.height, -maxY), maxY)

        lastOffset = offset
    }
}

#Preview {
    PetaView()
}
