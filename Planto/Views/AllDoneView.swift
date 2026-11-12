//
//  AllDoneView.swift
//  Planto
//

import SwiftUI

struct AllDoneView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            Image("plantoDone")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 160)
                .padding(24)
                .background(Color(white: 0.1), in: Circle())

            Text("All Done! 🎉")
                .font(.title2)
                .bold()

            Text("All Reminders Completed")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AllDoneView()
        .preferredColorScheme(.dark)
}
