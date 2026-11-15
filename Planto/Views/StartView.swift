//
//  StartView.swift
//  Planto
//

import SwiftUI

struct StartView: View {
    @State var showSheet = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Divider()

                Spacer()

                // ١. الصورة
                Image("planto")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 164, height: 200)

                // ٢. النصوص
                VStack(spacing: 12) {
                    Text("Start your plant journey!")
                        .font(.title2)
                        .bold()

                    Text("Now all your plants will be in one place and we will help you take care of them :) 🪴")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                }

                Spacer()

                // ٣. الزر
                Button {
                    showSheet = true
                } label: {
                    Text("Set Plant Reminder")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.plantGreen, in: Capsule())
                }
                .padding(.horizontal, 48)

                Spacer()
            }
            .navigationTitle("My Plants 🌱")
            .sheet(isPresented: $showSheet) {
                SetReminderView()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    StartView()
}
