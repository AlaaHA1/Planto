//
//  StartView.swift
//  Planto
//

import SwiftUI

struct StartView: View {
    var onStart: () -> Void = {}

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            // ١. الصورة
            Image("planto")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            // ٢. النصوص
            VStack(spacing: 16) {
                Text("Start your plant journey!")
                    .font(.title2)
                    .bold()

                Text("Now all your plants will be in one place and we will help you take care of them :) 🪴")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            .padding(.top, 40)

            Spacer()

            Button {
                onStart()
            } label: {
                Text("Set Plant Reminder")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.plantGreen, in: Capsule())
                    .overlay(
                        Capsule()
                            .strokeBorder(Color.glassRim, lineWidth: 1.5)
                    )
                    .glassEffect(.clear.interactive(), in: .capsule)
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 48)
            .padding(.bottom, 120)
        }
    }
}

#Preview {
    StartView()
        .preferredColorScheme(.dark)
}
