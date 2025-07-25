//
//  MainTabView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 25/07/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .mission
    
    enum Tab {
        case event, mission
    }
    
    var body: some View {
            ZStack(alignment: .bottom) {
                Group {
                    switch selectedTab {
                    case .event:
                        EventDetailsView()
                    case .mission:
                        MissionView()
                    }
                }
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.bottom, -16)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .navigationBarBackButtonHidden(true)
            .gesture(DragGesture())
//            .navigationBarHidden(true)
    }
}

#Preview {
    MainTabView()
}
