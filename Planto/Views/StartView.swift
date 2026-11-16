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

            // ٣. الزر
            Button {
                onStart()
            } label: {
                Text("Set Plant Reminder")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 280, height: 44)
                    .background(
                        Color(red: 0.36, green: 0.69, blue: 0.53),
                        in: Capsule()
                    )
            }
            .padding(.bottom, 120)
        }
    }
}

#Preview {
    StartView()
        .preferredColorScheme(.dark)
}
