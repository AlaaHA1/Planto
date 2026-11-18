//
//  SetReminderView.swift
//  Planto
//

import SwiftUI

struct SetReminderView: View {
    @Environment(\.dismiss) var dismiss

    var onSave: (Plant) -> Void = { _ in }
    var isEditing = false
    var onDelete: () -> Void = {}

    @State var name = ""
    @State var room: Room = .bedroom
    @State var light: Light = .fullSun
    @State var wateringDays: WateringDays = .everyDay
    @State var water: WaterAmount = .ml20to50

    // الاسم بدون مسافات في البداية والنهاية
    var trimmedName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var body: some View {
        NavigationStack {
            Form {
                // ١. اسم النبتة
                Section {
                    HStack(spacing: 8) {
                        Text("Plant Name")
                        TextField("Pothos", text: $name)
                            .tint(.checkGreen) // مؤشر أخضر
                    }
                }

                // ٢. الغرفة والإضاءة
                Section {
                    Picker(selection: $room) {
                        ForEach(Room.allCases, id: \.self) { room in
                            Text(room.rawValue).tag(room)
                        }
                    } label: {
                        rowLabel("Room", icon: "location")
                    }

                    Picker(selection: $light) {
                        ForEach(Light.allCases, id: \.self) { light in
                            Text(light.rawValue).tag(light)
                        }
                    } label: {
                        rowLabel("Light", icon: "sun.max")
                    }
                }

                // ٣. أيام السقي وكمية الماء
                Section {
                    Picker(selection: $wateringDays) {
                        ForEach(WateringDays.allCases, id: \.self) { days in
                            Text(days.rawValue).tag(days)
                        }
                    } label: {
                        rowLabel("Watering Days", icon: "drop")
                    }

                    Picker(selection: $water) {
                        ForEach(WaterAmount.allCases, id: \.self) { amount in
                            Text(amount.rawValue).tag(amount)
                        }
                    } label: {
                        rowLabel("Water", icon: "drop")
                    }
                }

                // ٤. زر الحذف (وقت التعديل بس)
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
            .font(.subheadline)          // خط أصغر مثل التصميم
            .tint(.secondary)            // قيم الـPicker رمادي
            .listSectionSpacing(28)      // مسافة بين الصناديق
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

                // زر ✓ (Liquid Glass)
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newPlant = Plant(
                            name: trimmedName,
                            room: room,
                            light: light,
                            wateringDays: wateringDays,
                            water: water
                        )
                        onSave(newPlant)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.plantGreen)
                    .disabled(trimmedName.isEmpty)
                }
            }
        }
        .preferredColorScheme(.dark)
    }

    // عنوان الصف: أيقونة بيضاء لاصقة بالكلمة (مثل التصميم)
    func rowLabel(_ title: String, icon: String) -> some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .foregroundStyle(.white)
            Text(title)
                .foregroundStyle(.white)
        }
    }
}

#Preview("Add") {
    SetReminderView()
}

#Preview("Edit") {
    SetReminderView(isEditing: true, name: "Pothos")
}
