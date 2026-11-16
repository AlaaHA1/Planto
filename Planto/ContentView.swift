//
//  ContentView.swift
//  Planto
//

import SwiftUI

struct ContentView: View {
    @State var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashView()
                    .transition(.opacity)
            } else {
                TodayReminderView()
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(2))
            withAnimation {
                showSplash = false
            }
        }
    }
}

#Preview {
    ContentView()
}
