//
//  TodayReminderView.swift
//  Planto
//

import SwiftUI

struct TodayReminderView: View {
    @State var plants: [Plant] = []
    @State var showSheet = false
    @State var plantToEdit: Plant?

    @AppStorage("hasStarted") var hasStarted = false

    var wateredCount: Int {
        plants.filter { $0.isWatered }.count
    }

    var progress: Double {
        if plants.isEmpty { return 0 }
        return Double(wateredCount) / Double(plants.count)
    }

    var headerText: String {
        if wateredCount == 0 {
            return "Your plants are waiting for a sip 💦"
        } else {
            return "\(wateredCount) of your plants feel loved today ✨"
        }
    }

    var allDone: Bool {
        !plants.isEmpty && wateredCount == plants.count
    }

    var showPlusButton: Bool {
        hasStarted || !plants.isEmpty
    }

    // اللي ما انسقت فوق، والمسقية تحت
    var sortedPlants: [Plant] {
        plants.filter { !$0.isWatered } + plants.filter { $0.isWatered }
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {

                // الطبقة ١: المحتوى
                VStack(spacing: 0) {
                    Divider()

                    if plants.isEmpty {
                        if hasStarted {
                            NoRemindersView()
                        } else {
                            StartView {
                                showSheet = true
                            }
                        }
                    } else if allDone {
                        AllDoneView()
                    } else {
                        // النص وشريط التقدم
                        VStack(spacing: 12) {
                            Text(headerText)
                                .font(.subheadline)

                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .fill(Color.progressTrack)
                                    Capsule()
                                        .fill(Color.progressGreen)
                                        .frame(width: geo.size.width * progress)
                                }
                            }
                            .frame(height: 8)
                            .animation(.easeInOut, value: progress)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)

                        // القائمة
                        List {
                            ForEach(sortedPlants) { plant in
                                PlantRowView(plant: plant) {
                                    toggleWatered(plant)
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    plantToEdit = plant
                                }
                                .listRowBackground(Color.clear)
                                .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        delete(plant)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                            }
                        }
                        .listStyle(.plain)
                    }
                }

                // الطبقة ٢: زر + (مثل Sketch)
                if showPlusButton {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .medium))
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 50)
                            // اللون الأخضر الصافي
                            .background(Color.plantGreen, in: Circle())
                            // الحافة الرفيعة الفاتحة
                            .overlay(
                                Circle()
                                    .strokeBorder(Color.glassRim, lineWidth: 1.5)
                            )
                            // حركة الـLiquid Glass لما تضغطين
                            .glassEffect(.clear.interactive(), in: .circle)
                    }
                    .buttonStyle(.plain)
                    .padding(.trailing, 24)
                    .padding(.bottom, 16)
                }
            }
            .navigationTitle("My Plants 🌱")
            // شيت الإضافة
            .sheet(isPresented: $showSheet) {
                SetReminderView(onSave: { newPlant in
                    withAnimation {
                        plants.append(newPlant)
                    }
                    hasStarted = true
                    NotificationManager.schedule(for: newPlant)
                })
            }
            // شيت التعديل
            .sheet(item: $plantToEdit) { plant in
                SetReminderView(
                    onSave: { updated in
                        update(plant, with: updated)
                    },
                    isEditing: true,
                    onDelete: {
                        delete(plant)
                    },
                    name: plant.name,
                    room: plant.room,
                    light: plant.light,
                    wateringDays: plant.wateringDays,
                    water: plant.water
                )
            }
            .onAppear {
                NotificationManager.requestPermission()
            }
        }
        .preferredColorScheme(.dark)
    }

    // نحدّث معلومات النبتة
    func update(_ plant: Plant, with updated: Plant) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index].name = updated.name
            plants[index].room = updated.room
            plants[index].light = updated.light
            plants[index].wateringDays = updated.wateringDays
            plants[index].water = updated.water

            NotificationManager.cancel(for: plants[index])
            NotificationManager.schedule(for: plants[index])
        }
    }

    // نعلّم النبتة إنها انسقت (أو نلغيها) حسب الـ id
    func toggleWatered(_ plant: Plant) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            withAnimation {
                plants[index].isWatered.toggle()
            }
        }
    }

    // نحذف النبتة
    func delete(_ plant: Plant) {
        NotificationManager.cancel(for: plant)
        withAnimation {
            plants.removeAll { $0.id == plant.id }
        }
    }
}

#Preview("New user") {
    TodayReminderView()
}

#Preview("With plants") {
    TodayReminderView(plants: Plant.samples)
}
