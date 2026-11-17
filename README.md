<div align="center">

# Planto 🌱

**Your plants, all in one place.**

A plant care reminder app for iPhone that helps you remember when to water each of your plants 💧

![Swift](https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-0D96F6?style=for-the-badge&logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS_27.2+-000000?style=for-the-badge&logo=apple&logoColor=white)

</div>

---

## 📖 Description

Many people love having plants at home, but it's easy to forget when each plant needs water. Some plants need water every day, others once a week, and each one needs a different amount. Planto solves this by keeping all your plants in one place and reminding you when it's time to water them.

With Planto, you add each plant with its room, light needs, watering schedule, and water amount. Every day you can see your plants in one list, mark the ones you watered, and track your progress until you see the **All Done 🎉** screen. Local notifications remind you even when the app is closed.

This app was built as a learning challenge at the **Apple Developer Academy**, where we took a prototype, broke it into screens, identified what we needed to learn, and built it step by step using SwiftUI.

---

## ✨ Main Features

- 🪴 **Add a plant reminder** with name, room, light, watering days, and water amount
- 📋 **View all plants** in one list with their care details
- ✅ **Mark plants as watered** by tapping the circle
- 📊 **Track progress** with an animated progress bar
- ✏️ **Edit or delete** a plant from the reminder sheet
- 👆 **Swipe to delete** a plant from the list
- 🎉 **All Done screen** when every plant is watered
- 🔔 **Local notifications** to remind you to water each plant
- 👋 **Onboarding and empty states** for new users and empty lists
- 🌙 **Dark mode design** with a Liquid Glass app icon

---

## 🛠 What We Used

**Layout & UI**
- `VStack`, `HStack`, `ZStack`, and `Spacer` for layout
- `NavigationStack` and `toolbar` for the title and buttons
- `List` and `ForEach` to show the plants
- `Form`, `Section`, `TextField`, and `Picker` for the Set Reminder sheet
- `ProgressView` with `withAnimation` for the animated progress bar
- `swipeActions` for swipe to delete
- **SF Symbols** for icons
- **Liquid Glass** button style (`.glassProminent`)

**Data & State**
- `struct` and `Identifiable` for the Plant model
- `enum` with `CaseIterable` for the picker options
- `@State` and Bindings (`$`) to update the UI
- `@Environment(\.dismiss)` to close the sheet
- `@AppStorage` to remember if the user is new
- Computed properties to count watered plants and calculate progress
- Closures (`onSave`, `onDelete`, `onToggle`) to pass actions between views

**System**
- `UserNotifications` for local watering reminders

**Tools**
- **Xcode 26**
- **Icon Composer** for the Liquid Glass app icon
- **Sketch** for the design
- **Git & GitHub** for version control

---

## 🚀 Getting Started

### Dependencies

- A Mac with **macOS** that supports Xcode 26
- **Xcode 26** or later
- **iOS 27.2** or later (iPhone or Simulator)
- No external libraries needed

### Installing

1. Clone the repository:
```
git clone https://github.com/AlaaHA1/Planto.git
```
2. Open the project folder
3. Double-click `Planto.xcodeproj` to open it in Xcode

### Executing Program

1. In Xcode, choose an iPhone simulator from the top bar (for example, iPhone 17)
2. Press **⌘ + R** or click the ▶️ Run button
3. When asked, tap **Allow** to enable notifications
4. Tap **Set Plant Reminder** to add your first plant 🌱

To run on a real iPhone:
1. Connect your iPhone and select it from the top bar
2. Go to **Signing & Capabilities** and choose your **Team**
3. On the iPhone, go to **Settings → General → VPN & Device Management** and trust the developer

---

## 📂 Project Structure

```
Planto
├── Models
│   ├── Plant.swift               → Plant model and options (enums)
│   ├── Theme.swift               → App colors
│   └── NotificationManager.swift → Watering reminders
├── Views
│   ├── SplashView.swift
│   ├── StartView.swift
│   ├── NoRemindersView.swift
│   ├── TodayReminderView.swift   → Main screen
│   ├── PlantRowView.swift        → Reusable plant row
│   ├── SetReminderView.swift     → Add and edit sheet
│   └── AllDoneView.swift
├── ContentView.swift
└── PlantoApp.swift
```

---

## 🆘 Help

- **The app doesn't open on my iPhone:** Go to Settings → General → VPN & Device Management and trust the developer. Make sure the iPhone is connected to the internet.
- **"OS version lower than deployment target":** Update your iPhone, or lower the iOS version in Xcode under General → Minimum Deployments.
- **Notifications don't appear:** Make sure you tapped **Allow**, then leave the app and wait for the reminder. You can also check Settings → Notifications → Planto.
- **The app icon doesn't update:** Delete the app from the device and run it again.

---

## 👩‍💻 Author

**Alaa Alanzi**
GitHub: [@AlaaHA1](https://github.com/AlaaHA1)

---

## 📌 Version History

- **1.0**
  - First release with plant reminders, watering progress, edit and delete, and notifications

---

## 🙏 Acknowledgments

- **Apple Developer Academy** mentors and team for their support
- [Apple Developer Documentation](https://developer.apple.com/documentation/swiftui)
- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines)
- [Swiftful Thinking](https://www.youtube.com/@SwiftfulThinking) SwiftUI tutorials

<div align="center">

Made with 💚 for plant lovers

</div>
