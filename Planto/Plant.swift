import Foundation

// MARK: - Room
enum Room: String, CaseIterable {
    case bedroom = "Bedroom"
    case livingRoom = "Living Room"
    case kitchen = "Kitchen"
    case balcony = "Balcony"
    case bathroom = "Bathroom"
}

// MARK: - Light
enum Light: String, CaseIterable {
    case fullSun = "Full Sun"
    case partialSun = "Partial Sun"
    case lowLight = "Low Light"

    var icon: String {
        switch self {
        case .fullSun: return "sun.max"
        case .partialSun: return "sun.horizon"
        case .lowLight: return "moon"
        }
    }
}

// MARK: - Watering Days
enum WateringDays: String, CaseIterable {
    case everyDay = "Every day"
    case every2Days = "Every 2 days"
    case every3Days = "Every 3 days"
    case onceAWeek = "Once a week"
    case every10Days = "Every 10 days"
    case every2Weeks = "Every 2 weeks"
}

// MARK: - Water Amount
enum WaterAmount: String, CaseIterable {
    case ml20to50 = "20-50 ml"
    case ml50to100 = "50-100 ml"
    case ml100to200 = "100-200 ml"
    case ml200to300 = "200-300 ml"
}

// MARK: - Plant
struct Plant: Identifiable {
    let id = UUID()
    var name: String
    var room: Room
    var light: Light
    var wateringDays: WateringDays
    var water: WaterAmount
    var isWatered: Bool = false
}

// MARK: - Sample Data
extension Plant {
    static let samples: [Plant] = [
        Plant(name: "Monstera", room: .kitchen, light: .fullSun, wateringDays: .everyDay, water: .ml20to50),
        Plant(name: "Pothos", room: .bedroom, light: .fullSun, wateringDays: .every2Days, water: .ml20to50),
        Plant(name: "Orchid", room: .livingRoom, light: .partialSun, wateringDays: .onceAWeek, water: .ml20to50),
        Plant(name: "Spider", room: .kitchen, light: .lowLight, wateringDays: .every3Days, water: .ml20to50)
    ]
}
