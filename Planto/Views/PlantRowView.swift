//
//  PlantRowView.swift
//  Planto
//

import SwiftUI

struct PlantRowView: View {
    let plant: Plant
    var onToggle: () -> Void = {}

    var body: some View {
        HStack(spacing: 14) {
            // ١. الدائرة
            Button {
                onToggle()
            } label: {
                ZStack {
                    if plant.isWatered {
                        Circle()
                            .fill(Color.checkGreen)
                        Image(systemName: "checkmark")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundStyle(.black)
                    } else {
                        Circle()
                            .stroke(Color.secondary, lineWidth: 1.5)
                    }
                }
                .frame(width: 24, height: 24)
                // Glass بس لما تكون مسقية
                .glassEffect(
                    plant.isWatered ? .regular.tint(.checkGreen).interactive() : .identity,
                    in: .circle
                )
            }
            .buttonStyle(.borderless)

            // ٢. المعلومات
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Image(systemName: "location")
                    Text("in \(plant.room.rawValue)")
                }
                .font(.caption)
                .foregroundStyle(.secondary)

                Text(plant.name)
                    .font(.title2)

                HStack(spacing: 6) {
                    TagView(text: plant.light.rawValue, icon: plant.light.icon, color: .tagYellow)
                    TagView(text: plant.water.rawValue, icon: "drop", color: .tagBlue)
                }
            }
            .opacity(plant.isWatered ? 0.5 : 1)
        }
        .padding(.vertical, 6)
    }
}

// التاق الصغير (Full sun / 20-50 ml)
struct TagView: View {
    let text: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.caption)
        .foregroundStyle(color)
        .padding(.horizontal, 8)
        .padding(.vertical, 5)
        .background(Color.tagBackground, in: RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    PlantRowView(plant: Plant.samples[0])
        .padding()
        .preferredColorScheme(.dark)
}
