//
//  SetReminderView.swift
//  Planto
//

import SwiftUI

struct SetReminderView: View {
    @Environment(\.dismiss) var dismiss

    // وش نسوي بالنبتة لما نضغط ✓
    var onSave: (Plant) -> Void = { _ in }

    // 🆕 هل نعدّل نبتة موجودة؟
    var isEditing = false

    // 🆕 وش نسوي لما نضغط Delete
    var onDelete: () -> Void = {}

    @State var name = ""
    @State var room: Room = .bedroom
    @State var light: Light = .fullSun
    @State var wateringDays: WateringDays = .everyDay
    @State var water: WaterAmount = .ml20to50

    var body: some View {
        NavigationStack {
            Form {
                // ١. اسم النبتة
                Section {
                    HStack {
                        Text("Plant Name")
                        TextField("Pothos", text: $name)
                    }
                }

                // ٢. الغرفة والإضاءة
                Section {
                    Picker(selection: $room) {
                        ForEach(Room.allCases, id: \.self) { room in
                            Text(room.rawValue).tag(room)
                        }
                    } label: {
                        Label("Room", systemImage: "location")
                    }

                    Picker(selection: $light) {
                        ForEach(Light.allCases, id: \.self) { light in
                            Text(light.rawValue).tag(light)
                        }
                    } label: {
                        Label("Light", systemImage: "sun.max")
                    }
                }

                // ٣. أيام السقي وكمية الماء
                Section {
                    Picker(selection: $wateringDays) {
                        ForEach(WateringDays.allCases, id: \.self) { days in
                            Text(days.rawValue).tag(days)
                        }
                    } label: {
                        Label("Watering Days", systemImage: "drop")
                    }

                    Picker(selection: $water) {
                        ForEach(WaterAmount.allCases, id: \.self) { amount in
                            Text(amount.rawValue).tag(amount)
                        }
                    } label: {
                        Label("Water", systemImage: "drop")
                    }
                }

                // 🆕 ٤. زر الحذف (يطلع بس وقت التعديل)
                if isEditing {
                    Section {
                        Button(role: .destructive) {
                            onDelete()
                            dismiss()
                        } label: {
                            Text("Delete Reminder")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // زر ✕
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }

                // زر ✓
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newPlant = Plant(
                            name: name,
                            room: room,
                            light: light,
                            wateringDays: wateringDays,
                            water: water
                        )
                        onSave(newPlant)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.plantGreen)
                    .disabled(name.isEmpty)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview("Add") {
    SetReminderView()
}

#Preview("Edit") {
    SetReminderView(isEditing: true, name: "Pothos")
}
