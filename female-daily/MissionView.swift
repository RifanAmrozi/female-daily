//
//  MissionJourneyView.swift
//  female-daily
//
//  Created by Evelyn Wijaya on 24/07/25.
//

import SwiftUI

struct MissionView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Hello, Mission!")
                Spacer()
            }
            .navigationTitle("Mission")
        }
    }
}

#Preview {
    MissionView()
}
