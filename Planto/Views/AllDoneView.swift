//
//  AllDoneView.swift
//  Planto
//

import SwiftUI

struct AllDoneView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            ZStack {
                // الطبقة ١: الدائرة
                Circle()
                    .fill(Color(white: 0.1))
                    .frame(width: 190, height: 190)
                    .offset(y: 15)

                // الطبقة ٢: النبتة (أكبر من الدائرة)
                Image("plantoDone")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 220)
            }

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
