//
//  NoRemindersView.swift
//  Planto
//

import SwiftUI

struct NoRemindersView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {

                // الطبقة ١: المحتوى
                VStack {
                    Divider()
                    Spacer()
                    Text("No reminders set yet..")
                        .foregroundStyle(.secondary)
                    Spacer()
                }

                // الطبقة ٢: زر +
                Button {
                    // بعدين: يفتح شيت Set Reminder
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 56, height: 56)
                        .background(Color.plantGreen, in: Circle())
                }
                .padding()
            }
            .navigationTitle("My Plants 🌱")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NoRemindersView()
}
