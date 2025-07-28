//
//  MissionMapView.swift
//  female-daily
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 24/07/25.
//

import SwiftUI
import SpriteKit

struct MissionMapView: View {
    @State private var tooltipPosition: CGPoint = .zero
    @State private var showTooltip: Bool = false
    @State private var myScene = LevelMapScene(size: UIScreen.main.bounds.size)
    
    var body: some View {
        ZStack {
            SpriteView(scene: myScene, options: [.allowsTransparency])
                .ignoresSafeArea()
                .onAppear {
                    // Delay untuk pastikan node sudah ditambahkan
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if let mascotNode = myScene.childNode(withName: "level_active") {
                            tooltipPosition = CGPoint(x: 0, y: mascotNode.position.y)
                            showTooltip = true
                        }
                    }
                }
            
            if showTooltip {
                VStack {
                    TooltipMascotView(
                        onPergi: { print("Pergi tapped") },
                        onAcak: { print("Acak tapped") }
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .transition(.opacity)
                    
                    Spacer()
                        .frame(height: 150)
                }
            }
        }
    }
}

#Preview {
    MissionMapView()
}
