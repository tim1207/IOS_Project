import Foundation

struct User : Identifiable,Codable {
    let id = UUID()
    var Device: String
    var Version: String
    var BatteryHealth: Int
    var PowerConsumption: Bool
    var Smoothness: Int
}

