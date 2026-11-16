//
//  NoRemindersView.swift
//  Planto
//

import SwiftUI

struct NoRemindersView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("No reminders set yet..")
                .foregroundStyle(.secondary)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack {
        VStack(spacing: 0) {
            Divider()
            NoRemindersView()
        }
        .navigationTitle("My Plants 🌱")
    }
    .preferredColorScheme(.dark)
}
