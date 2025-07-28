//
//  LevelMapScene.swift
//  female-daily
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 24/07/25.
//

import SpriteKit

class LevelMapScene: SKScene {
    
    let cameraNode = SKCameraNode()
    let tileHeight: CGFloat = 800  // tinggi tile background
    let totalLevels = 10
    
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        
        // Ukuran scene vertikal diperbesar
        self.size = CGSize(width: view.bounds.width, height: CGFloat(totalLevels) * 300 + 500)
        self.scaleMode = .aspectFill
        
        setupCamera()
        setupTiledBackground(imageNamed: "bg-mission-map")
        setupLevels()
    }
    
    func setupCamera() {
        camera = cameraNode
        addChild(cameraNode)
        
        // Mulai dari posisi bawah layar
        cameraNode.position = CGPoint(x: size.width / 2, y: view!.bounds.height / 2)
    }
    
    func setupTiledBackground(imageNamed: String) {
        guard let view = self.view else { return }
        
        let screenWidth = view.bounds.width
        let tilesCount = Int(ceil(self.size.height / tileHeight))
        
        for i in 0..<tilesCount {
            let tile = SKSpriteNode(imageNamed: imageNamed)
            tile.size = CGSize(width: screenWidth, height: tileHeight)
            tile.anchorPoint = CGPoint(x: 0.5, y: 0)
            tile.position = CGPoint(
                x: self.size.width / 2,
                y: CGFloat(i) * tileHeight
            )
            //            tile.zPosition = -100
            addChild(tile) // tambahkan ke scene, bukan ke camera
        }
    }
    
    func setupLevels() {
        for i in 0..<totalLevels {
            let wrapper = SKNode()
            wrapper.name = "level_\(i + 1)"
            
            let levelNode = SKSpriteNode(imageNamed: i == 0 ? "mushroom-active-1" : "mushroom-inactive-1")
            levelNode.size = CGSize(width: 200, height: 200) // atur sesuai ukuran gambar
            
            // Tambahkan sparkle efek
            if i == 0 {
                wrapper.name = "level_active"
                addTwinkleEffect(to: levelNode)
                addMascot(on: levelNode)
            }
            
            let label = SKLabelNode(text: "\(i + 1)")
            label.fontName = "Montserrat"
            label.fontSize = 24
            label.verticalAlignmentMode = .center
            label.horizontalAlignmentMode = .center
            label.position = CGPoint(
                x: label.position.x,
                y: label.position.y - 65
            )
            levelNode.addChild(label)
            
            wrapper.addChild(levelNode)
            
            wrapper.position = CGPoint(
                x: CGFloat.random(in: 100...280),
                y: CGFloat(i) * 300 + (i == 0 ? 130 : 200)
            )
            
            addChild(wrapper)
        }
    }
    
    // MARK: - Touch-based drag scrolling (vertical only)
    private var previousTouchLocation: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        previousTouchLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first,
              let previousLocation = previousTouchLocation else { return }
        
        let currentLocation = touch.location(in: self)
        let deltaY = currentLocation.y - previousLocation.y
        
        // Hitung posisi baru kamera
        var newCameraY = cameraNode.position.y - deltaY
        
        // Batasi scroll hanya ke atas
        let bottomLimit = view!.bounds.height / 2
        let topLimit = size.height - view!.bounds.height / 2
        newCameraY = max(bottomLimit, min(topLimit, newCameraY))
        
        cameraNode.position.y = newCameraY
        previousTouchLocation = currentLocation
    }
    
    func addShimmer(to node: SKSpriteNode) {
        let shimmerWidth = node.size.width * 0.5
        let shimmerHeight = node.size.height * 2

        // 1. Buat shimmer sprite (bisa pakai warna putih semi transparan atau texture)
        let shimmer = SKSpriteNode(color: .white, size: CGSize(width: shimmerWidth, height: shimmerHeight))
        shimmer.alpha = 0.25
        shimmer.zRotation = .pi / 4
        shimmer.blendMode = .add
        shimmer.position = CGPoint(x: -node.size.width, y: 0)

        // 2. Buat crop node sebagai container shimmer
        let cropNode = SKCropNode()
        cropNode.zPosition = 1

        // 3. Mask pakai bentuk node-nya sendiri (jadi shimmer tidak keluar dari node)
        let mask = SKSpriteNode(texture: node.texture)
        mask.size = node.size
        cropNode.maskNode = mask

        cropNode.addChild(shimmer)
        node.addChild(cropNode)

        // 4. Gerakan shimmer dari kiri ke kanan lalu ulang
        let move = SKAction.moveBy(x: node.size.width * 2, y: 0, duration: 1.2)
        let reset = SKAction.moveTo(x: -node.size.width, duration: 0)
        let shimmerSequence = SKAction.sequence([move, reset])
        shimmer.run(SKAction.repeatForever(shimmerSequence))
    }

    func addTwinkleEffect(to node: SKSpriteNode) {
        // 1. Buat sprite kilau kecil (misal gambar bintang transparan)
        let sparkle = SKSpriteNode(imageNamed: "sparkle")
        sparkle.size = CGSize(width: node.size.width * 1, height: node.size.height * 1)
        sparkle.position = CGPoint(x: 0, y: node.size.height / 4)
        sparkle.alpha = 0.0
        sparkle.zPosition = 1
        sparkle.blendMode = .add

        // 2. Crop agar efek tidak keluar dari bentuk level
        let crop = SKCropNode()
        let mask = SKSpriteNode(texture: node.texture)
        mask.size = node.size
        crop.maskNode = mask
        crop.addChild(sparkle)
        node.addChild(crop)

        // 3. Animasi berkedip (fade in - fade out)
        let fadeIn = SKAction.fadeAlpha(to: 0.8, duration: 0.4)
        let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: 0.4)
        let wait = SKAction.wait(forDuration: Double.random(in: 1.0...2.0))
        let twinkle = SKAction.sequence([wait, fadeIn, fadeOut])
        let repeatTwinkle = SKAction.repeatForever(twinkle)

        sparkle.run(repeatTwinkle)
    }

    func addMascot(on level: SKSpriteNode) {
        // 1. Buat node maskot dengan gambar awal
        let mascot = SKSpriteNode(imageNamed: "bun-bun-open-eye")
        mascot.name = "bun-bun-the-bunny"
        
        // 2. Atur ukuran dan posisi di atas level
        mascot.size = CGSize(width: 128, height: 200)
        mascot.position = CGPoint(x: 0, y: (level.size.height / 2 + mascot.size.height / 2) - 30)
        mascot.zPosition = 999

//        addSpeechBubble(to: mascot, text: "Hai!", in: self)

        // 3. Tambahkan ke level
        level.addChild(mascot)
        print("🐰 Menambahkan maskot di \(mascot.position)")

        // 4. Buat animasi melambai (berdiri → lambaikan → berdiri)
        let standingTexture = SKTexture(imageNamed: "bun-bun-open-eye")
        let closingEyeTexture = SKTexture(imageNamed: "bun-bun-close-eye")
        let wavingTexture = SKTexture(imageNamed: "bun-bun-hi")
        
        let animation = SKAction.animate(with: [standingTexture, closingEyeTexture, wavingTexture, wavingTexture, standingTexture], timePerFrame: 0.4)
        let wait = SKAction.wait(forDuration: 0.5)
        let sequence = SKAction.sequence([wait, animation])
        let repeatForever = SKAction.repeatForever(sequence)

        mascot.run(repeatForever)
    }
    
    func addSpeechBubble(to mascot: SKSpriteNode, text: String, in scene: SKScene) {
        // Ukuran bubble
        let bubbleWidth: CGFloat = 180
        let bubbleHeight: CGFloat = 60
        let verticalOffset: CGFloat = 20 // Jarak dari kepala maskot ke bubble

        // Buat bubble
        let bubble = SKShapeNode(rectOf: CGSize(width: bubbleWidth, height: bubbleHeight), cornerRadius: 15)
        bubble.fillColor = .white
        bubble.strokeColor = .gray
        bubble.lineWidth = 2
        bubble.zPosition = mascot.zPosition + 1

        // Label teks
        let label = SKLabelNode(text: text)
        label.fontName = "AvenirNext-Bold"
        label.fontSize = 14
        label.fontColor = .black
        label.numberOfLines = 2
        label.preferredMaxLayoutWidth = bubbleWidth - 20
        label.verticalAlignmentMode = .center
        label.horizontalAlignmentMode = .center
        label.position = .zero
        label.zPosition = bubble.zPosition + 1

        // Group node
        let speechNode = SKNode()
        speechNode.addChild(bubble)
        speechNode.addChild(label)
        speechNode.name = "speechBubble"

        // ==== PERHITUNGAN POSISI ====

        // Posisi target: tepat di atas maskot
        var targetX = mascot.position.x
        var targetY = mascot.position.y + (mascot.size.height / 2) + (bubbleHeight / 2) + verticalOffset

        // Margin layar
        let margin: CGFloat = 10
        let halfWidth = bubbleWidth / 2
        let halfHeight = bubbleHeight / 2

        // Koreksi posisi X agar tidak keluar layar
        targetX = max(margin + halfWidth, min(scene.size.width - margin - halfWidth, targetX))

        // Koreksi posisi Y agar tetap di atas maskot tapi tidak keluar atas layar
        let maxY = scene.size.height - margin - halfHeight
        if targetY > maxY {
            targetY = maxY
        }

        // Set posisi akhir
        speechNode.position = CGPoint(x: targetX, y: targetY)

        // Tambahkan ke scene
        scene.addChild(speechNode)

        // Animasi muncul dan hilang (opsional)
        speechNode.alpha = 0
        speechNode.run(SKAction.sequence([
            SKAction.fadeIn(withDuration: 0.25),
            SKAction.wait(forDuration: 3.0),
            SKAction.fadeOut(withDuration: 0.4),
            SKAction.removeFromParent()
        ]))
    }

}

import SwiftUI
#Preview {
    MissionMapView()
}
