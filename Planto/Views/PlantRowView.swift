//
//  PlantRowView.swift
//  Planto
//

import SwiftUI

struct PlantRowView: View {
    let plant: Plant
    var onToggle: () -> Void = {} // 🆕 وش يصير لما نضغط الدائرة

    var body: some View {
        HStack(spacing: 16) {
            // ١. الدائرة 🆕 صارت زر
            Button {
                onToggle()
            } label: {
                Image(systemName: plant.isWatered ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(plant.isWatered ? Color.checkGreen : Color.secondary)
            }
            .buttonStyle(.borderless)

            // ٢. المعلومات
            VStack(alignment: .leading, spacing: 6) {
                Label("in \(plant.room.rawValue)", systemImage: "location")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(plant.name)
                    .font(.title2)

                HStack(spacing: 8) {
                    TagView(text: plant.light.rawValue, icon: plant.light.icon, color: .tagYellow)
                    TagView(text: plant.water.rawValue, icon: "drop", color: .tagBlue)
                }
            }
            .opacity(plant.isWatered ? 0.5 : 1) // 🆕 باهتة لو انسقت
        }
        .padding(.vertical, 8)
    }
}

// التاق الصغير (Full sun / 20-50 ml)
struct TagView: View {
    let text: String
    let icon: String
    let color: Color

    var body: some View {
        Label(text, systemImage: icon)
            .font(.caption)
            .foregroundStyle(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.tagBackground, in: RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    PlantRowView(plant: Plant.samples[0])
        .padding()
        .preferredColorScheme(.dark)
}
