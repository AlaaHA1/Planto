//
//  TodayReminderView.swift
//  Planto
//

import SwiftUI

struct TodayReminderView: View {
    @State var plants = Plant.samples
    @State var showSheet = false
    @State var plantToEdit: Plant?

    // كم نبتة انسقت؟
    var wateredCount: Int {
        plants.filter { $0.isWatered }.count
    }

    // نسبة التقدم (من 0 إلى 1)
    var progress: Double {
        if plants.isEmpty { return 0 }
        return Double(wateredCount) / Double(plants.count)
    }

    // النص يتغير حسب العدد
    var headerText: String {
        if wateredCount == 0 {
            return "Your plants are waiting for a sip 💦"
        } else {
            return "\(wateredCount) of your plants feel loved today ✨"
        }
    }

    // 🆕 هل كل النباتات انسقت؟
    var allDone: Bool {
        !plants.isEmpty && wateredCount == plants.count
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {

                // الطبقة ١: المحتوى
                VStack(spacing: 0) {
                    Divider()

                    // 🆕 لو كلها انسقت: شاشة الاحتفال
                    if allDone {
                        AllDoneView()
                    } else {
                        // النص وشريط التقدم
                        VStack(spacing: 12) {
                            Text(headerText)
                            ProgressView(value: progress)
                                .tint(.plantGreen)
                        }
                        .padding()

                        // القائمة
                        List {
                            ForEach($plants) { $plant in
                                PlantRowView(plant: plant) {
                                    withAnimation {
                                        plant.isWatered.toggle()
                                    }
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    plantToEdit = plant
                                }
                                .listRowBackground(Color.clear)
                                // 🆕 السوايب للحذف
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

                // الطبقة ٢: زر +
                Button {
                    showSheet = true
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
            // شيت الإضافة
            .sheet(isPresented: $showSheet) {
                SetReminderView(onSave: { newPlant in
                    plants.append(newPlant)
                    NotificationManager.schedule(for: newPlant) // 🆕
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
            // 🆕 نطلب إذن الإشعارات أول ما تفتح الشاشة
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

            // 🆕 نعيد جدولة التذكير بالمعلومات الجديدة
            NotificationManager.cancel(for: plants[index])
            NotificationManager.schedule(for: plants[index])
        }
    }

    // نحذف النبتة
    func delete(_ plant: Plant) {
        NotificationManager.cancel(for: plant) // 🆕
        withAnimation {
            plants.removeAll { $0.id == plant.id }
        }
    }
}

#Preview {
    TodayReminderView()
}
