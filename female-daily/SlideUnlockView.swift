import SwiftUI

struct SlideUnlockView: View {
    @State private var dragOffset: CGFloat = 0
    @State private var isUnlocked = false
    @Binding var selectedTab: String
    
    let totalWidth: CGFloat = 300
    let handleSize: CGFloat = 60
    
    var body: some View {
        ZStack {
            // Track
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.gray.opacity(0.2))
                .background(Constants.PrimarySecondary700)
                .cornerRadius(100)
                .frame(maxWidth: .infinity, maxHeight: 56)
            
            // Shimmering text
            if !isUnlocked {
                ShimmerText()
                    .offset(x: dragOffset == 0 ? 0 : -40)
            } else {
                Text("Tukarkan Tiket")
                    .font(
                        Font.custom("Montserrat", size: 15)
                            .weight(.bold)
                    )
                    .foregroundColor(Constants.BackgroundColor)
                    .padding(.leading,8)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity , alignment: .center)
            }
            
            // Handle
            HStack {
                HStack(alignment: .center) {
                    Image("Vector")
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                        .frame(width: 40, height: 40, alignment: .center)
                        .background(Constants.PrimarySecondary50)
                        .cornerRadius(100)
                        .offset(x: dragOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if value.translation.width > 0 && value.translation.width <= totalWidth - handleSize {
                                        dragOffset = value.translation.width
                                    }
                                }
                                .onEnded { value in
                                    if dragOffset > totalWidth - handleSize - 30 {
                                        isUnlocked = true
                                        dragOffset = totalWidth - handleSize
                                        selectedTab = "tiketqr"
                                    } else {
                                        dragOffset = 0
                                    }
                                }
                        )
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
        }
        .animation(.easeOut, value: dragOffset)
    }
}

struct ShimmerText: View {
    @State private var shimmerPhase: CGFloat = 1
    
    var body: some View {
        Text("Tukar Tiket")
            .font(
                Font.custom("Montserrat", size: 15)
                    .weight(.bold)
            )
            .padding(.leading,8)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity , alignment: .center)
            .foregroundColor(Constants.BackgroundColor)
            .overlay(
                LinearGradient(gradient: Gradient(colors: [.clear, .white.opacity(0.6), .clear]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .rotationEffect(.degrees(30))
                .offset(x: shimmerPhase * 300)
                .mask(Text("Lepaskan Tiket").font(.headline).padding(.leading,8))
            )
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                    shimmerPhase = 1.5
                }
            }
    }
}


#Preview {
    VStack(spacing: 40) {
        SlideUnlockView(selectedTab: Binding.constant("tiketsaya"))
    }
    .padding()
}
