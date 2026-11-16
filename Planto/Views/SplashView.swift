//
//  SplashView.swift
//  Planto
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            // الخلفية سودا تغطي الشاشة كلها
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image("planto")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 170)

                Text("Planto")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)

                Text("Plant Care reminders 🌿")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    SplashView()
        .preferredColorScheme(.dark)
}
