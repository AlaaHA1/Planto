//
//  NotificationManager.swift
//  Planto
//

import UserNotifications

enum NotificationManager {

    // ١. نطلب الإذن من المستخدم
    static func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }

    // ٢. نجدول تذكير للنبتة
    static func schedule(for plant: Plant) {
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your \(plant.name) 🌱"
        content.sound = .default

        // كل كم ثانية؟ (الأيام × ٢٤ ساعة × ٦٠ دقيقة × ٦٠ ثانية)
        let seconds = Double(plant.wateringDays.days * 24 * 60 * 60)

        // repeats: true عشان يتكرر كل فترة سقي، مو مرة وحدة بس
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: true)

        let request = UNNotificationRequest(
            identifier: plant.id.uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }

    // ٣. نلغي التذكير لما تنحذف النبتة
    static func cancel(for plant: Plant) {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [plant.id.uuidString])
    }
}
